#= require helper/_bootbox
#= require helper/_DataTables
#= require helper/_moment
#= require helper/multi-modal
do ($ = jQuery) -> $ ->
	$('#refresh-btn').on 'ajax:success', (event, data, status, xhr) ->
		$('#index-user-table').DataTable
			data: data
			deferRender: true
			destroy: true
			searching: false
			rowId: 'id'
			columns: [
				{
					data: 'username'
				}, {
					data: 'name'
				}, {
					data: 'telephone'
				}, {
					data: 'email'
				}, {
					data: 'role'
				}, {
					data: null
					render: (data, type, row, meta) ->
						"""
						<a class="btn btn-danger btn-xs destroy-user-btn" href="#{row.href}" data-remote="true" data-method="delete">删除</a>
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

	# 用户移除回显
	$(document).on 'ajax:success', '.destroy-user-btn', (event, data, status, xhr) ->
		dislayMessage(data)

	# 初始刷新
	$('#refresh-btn').click()