#= require helper/_DataTables
#= require helper/_datetimepicker
#= require helper/_iCheck
#= require helper/_select2
#= require toastr
do ($ = jQuery) -> $ ->
	delay_ms = 200
	delay_s = delay_ms / 1000
	current = interval = $('#progress-bar').attr('aria-valuemax')
	counting = false
	timer = null

	flushPrgressBar = (second = current, precent = second * 100 / interval) ->
		$('#progress-bar').css('width', "#{precent}%").attr('aria-valuenow', current).text("自动刷新：#{Math.round(current)}s")

	do countDown = () ->
		current -= delay_s
		current = interval if current < 0
		flushPrgressBar()
		# remote request
		timer = setTimeout(countDown, delay_ms) if counting

	countingStart = () ->
		counting = true
		countDown()
		$('#refresh-control').removeClass('btn-success start').addClass('btn-danger pause')
		$('#progress-bar').addClass('active')

	countingPause = () ->
		window.clearTimeout(timer)
		counting = false
		$('#progress-bar').removeClass('active')
		$('#refresh-control').removeClass('btn-danger pause').addClass('btn-success start')

	$('#refresh-control').click((event) ->
		if counting
			countingPause()
		else
			countingStart()
	)

	$('#refresh-control').click()

	$('#refresh').click((event) ->
		restart = false
		if counting
			countingPause()
			restart = true
		current = interval
		if restart
			countingStart()
		else
			flushPrgressBar()
	)

	refresh_table = -> (data)
	# nothing

	$('#create').on 'ajax:success', (event, data, status, xhr) ->
		if (data.status)
			toastr.success(data.message)
			$('#refresh').click()
			$("#create-modal").modal('toggle')
		else
			toastr.error(data.message)

	$(document).on 'ajax:success', '#show-screenshot-refresh', (event, data, status, xhr) ->
		console.log(@, arguments)
		$('#show-screenshot').attr('src', "#{$('#show-screenshot').data('url')}?#{$.param t: Date.now()}")

	idRender = (data, type, row, meta) ->
		"""
		<input type='checkbox' name='check' value='#{data}'>
		"""

	datetimeRender = (data, type, row, meta) ->
		moment(data).format('YYYY-MM-DD HH:mm:ss')

	detailRender = (data, type, row, meta) ->
		"""
		<a class="btn btn-danger btn-xs" href="#" data-toggle="modal" data-target="#show-modal" data-href="#{row.href}">详情</a>
		"""

	$('#show-modal').on 'show.bs.modal', (event) ->
		content = $(@).find('.modal-content')
		content.load($(event.relatedTarget).data('href'))
		img = content.find('#show-screenshot')
		img.data('url', img.attr('src'))

	$('#index-form').on 'ajax:success', (event, data, status, xhr) ->
		$('#index-table').DataTable
			data: data
			autoWidth: false
			deferRender: true
			destroy: true
			rowId: 'id'
			order: [1, 'asc']
			columns: [
				{
					data: 'id'
					className: 'text-center'
					width: '1ex'
					render: idRender
					orderable: false
				}, {
					data: 'found_time'
					width: '20ex'
					render: datetimeRender
				}, {
					data: 'report_time'
					width: '20ex'
					render: datetimeRender
				}, {
					data: 'origin'
					width: '14ex'
				}, {
					data: 'url'
				}, {
					data: 'status'
					width: '8ex'
				}, {
					data: null,
					width: '5ex'
					render: detailRender
				},
			]
			drawCallback: (settings ) ->
				$(':checkbox', @).iCheck(checkboxClass: 'icheckbox_square-blue')

	$('#index-form').trigger 'submit'