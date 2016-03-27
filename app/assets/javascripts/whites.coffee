#= require helper/_bootbox
#= require helper/_DataTables
#= require helper/_moment
#= require helper/multi-modal
do ($ = jQuery) -> $ ->
	# 白名单列表刷新回调
	$('#refresh-btn').on 'ajax:success', (event, data, status, xhr) ->
		$('#index-white-table').DataTable
			data: data
			deferRender: true
			destroy: true
			searching: false
			rowId: 'id'
			columns: [
				{
					data: 'url'
				}, {
					data: 'disposer'
				}, {
					data: 'time'
					render: (data, type, row, meta) ->
						moment(data).format('YYYY-MM-DD HH:mm:ss')
				},  {
					data: null
					render: (data, type, row, meta) ->
						"""
						<a class="btn btn-danger btn-xs destroy-white-btn" href="#{row.href}" data-remote="true" data-method="delete">移除</a>
						"""
				}
			]
		event.stopPropagation()

	dislayMessage = (data) ->
		if data.status
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

	# 白名单添加和移除回显
	$('#create-white-form').on 'ajax:success', (event, data, status, xhr) ->
		dislayMessage(data)

	# 白名单移除回显
	$(document).on 'ajax:success', '.destroy-white-btn', (event, data, status, xhr) ->
		dislayMessage(data)

	# 初始刷新
	$('#refresh-btn').click()
