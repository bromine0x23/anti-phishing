#= require helper/_bootbox
#= require helper/_DataTables
#= require helper/_datetimepicker
#= require helper/_iCheck
#= require helper/_select2
#= require helper/multi-modal
do ($ = jQuery) -> $ ->
	delay_ms = 200
	delay_s = delay_ms / 1000
	current = interval = $('#index-report-progress-bar').attr('aria-valuemax')
	counting = false
	timer = null

	flushPrgressBar = (second = current, precent = current * 100 / interval) ->
		$progressBar = $('#index-report-progress-bar')
		$progressBar
			.css('width', "#{precent}%")
			.attr('aria-valuenow', current)
			.text($progressBar.data('format').replace('{second}', Math.round(current)))

	do countDown = () ->
		current -= delay_s
		current = interval if current < 0
		flushPrgressBar()
		# remote request
		timer = window.setTimeout(countDown, delay_ms) if counting

	countingStart = () ->
		counting = true
		countDown()
		$('#refresh-control-btn').removeClass('btn-success start').addClass('btn-danger pause')
		$('#index-report-progress-bar').addClass('active')

	countingPause = () ->
		window.clearTimeout(timer)
		counting = false
		$('#index-report-progress-bar').removeClass('active')
		$('#refresh-control-btn').removeClass('btn-danger pause').addClass('btn-success start')

	$('#refresh-control-btn').click((event) ->
		if counting
			countingPause()
		else
			countingStart()
	).click()

	$('#refresh-btn').click((event) ->
		restart = counting
		if restart
			countingPause()
		current = interval
		if restart
			countingStart()
		else
			flushPrgressBar()
	)

	$('#create-form').on 'ajax:success', (event, data, status, xhr) ->
		if (data.status)
			$('#create-report-modal').modal('hide')
			$('#create-form :reset').click()
			bootbox.alert
				message: data.message
				size: 'small'
				buttons:
					ok:
						className: 'btn-success'
			$('#refresh-btn').click()
		else
			bootbox.alert
				message: data.message
				size: 'small'
				buttons:
					ok:
						className: 'btn-danger'

	idRender = (data, type, row, meta) ->
		"""
		<input type='checkbox' name='check' value='#{data}'>
		"""
	datetimeRender = (data, type, row, meta) ->
		moment(data).format('YYYY-MM-DD HH:mm:ss')
	urlRender = (data, type, row, meta) ->
		"""
		<a href="#{data}" target="_blank">#{data}</a>
		"""
	detailRender = (data, type, row, meta) ->
		"""
		<a class="btn btn-info btn-xs" href="#" data-toggle="modal" data-target="#show-report-modal" data-href="#{row.href}">详情</a>
		"""

	$('#show-report-modal').on 'show.bs.modal', (event) ->
		content = $(event.currentTarget).find('.modal-content')
		content.load $(event.relatedTarget).data('href'), (text, status,xhr) ->
			screenshot = @find('#show-screenshot')
			screenshot.data('url', screenshot.attr('src'))
	$(document).on 'ajax:success', '#update-screenshot-btn', (event, data, status, xhr) ->
		$('#show-screenshot').attr('src', "#{$('#show-screenshot').data('url')}?#{$.param t: Date.now()}")

	$('#index-report-form').on 'ajax:success', (event, data, status, xhr) ->
		$('#index-report-table').DataTable
			data: data.reports
			autoWidth: false
			deferRender: true
			destroy: true
			stateSave: true
			rowId: 'id'
			order: [1, 'asc']
			columns: [
				#{
				#	data: 'id'
				#	className: 'text-center'
				#	width: '1ex'
				#	render: idRender
				#	orderable: false
				#},
				{
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
					render: urlRender
				}, {
					data: 'status'
					width: '8ex'
				}, {
					data: null,
					width: '6ex'
					orderable: false
					render: detailRender
				},
			]
			drawCallback: (settings ) ->
				$(':checkbox', @).iCheck(checkboxClass: 'icheckbox_square-blue')

	$('#index-report-form').trigger 'submit'

	$('.input-group-addon-select').on 'click', '.dropdown-menu .dropdown-item', (event) ->
		$target = $(event.currentTarget)
		$select = $target.closest('.input-group-addon-select')
		$select.find('.input-group-addon-select-label').text($target.data('text'))
		$select.find('.input-group-addon-select-input').val($target.data('value'))
		$select.children('.dropdown-toggle').dropdown('toggle')
	$('.input-group-addon-select .dropdown-menu .dropdown-item:first-child').click()

	$(document).on 'ajax:success', '.confirm-report-btn,.ignore-report-btn', (event, data, status, xhr) ->
		console.log(@, arguments)
		if data.status
			$('#show-report-modal').modal('hide')
			bootbox.alert
				message: data.message
				size: 'small'
				buttons:
					ok:
						className: 'btn-success'
			$('#refresh-btn').click()
		else
			bootbox.alert
				message: data.message
				size: 'small'
				buttons:
					ok:
						className: 'btn-danger'