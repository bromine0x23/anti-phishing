#= require helper/_DataTables
#= require helper/_moment
#= require toastr
do ($ = jQuery) -> $ ->
	$('#create-form').on 'ajax:success', (event, data, status, xhr) ->
		if data.status
			toastr.success(data.message)
			$('#refresh-btn').click()
		else
			toastr.error(data.message)

	$('#refresh-btn').on 'ajax:success', (event, data, status, xhr) ->
		$('#index-table').DataTable
			data: data
			autoWidth: false
			deferRender: true
			destroy: true
			searching: false
			rowId: 'id'
			columns: [
				{
					data: 'url'
				}, {
					data: 'disposer'
					width: '20ex'
				}, {
					data: 'time'
					width: '40ex'
					render: (data, type, row, meta) ->
						moment(data).format('YYYY-MM-DD HH:mm:ss')
				},  {
					data: null
					width: '10ex'
					render: (data, type, row, meta) ->
						"""
						<a class="btn btn-danger btn-xs white-destroy" href="#{row.href}" data-remote="true" data-method="delete"><span class="fa fa-trash"></span> 移除</a>
						"""
				}
			]
		event.stopPropagation()

	$(document).on 'ajax:success', '.white-destroy', (event, data, status, xhr) ->
		if data.status
			toastr.success(data.message)
			$('#refresh-btn').click()
		else
			toastr.error(data.message)

	$('#refresh-btn').click()
