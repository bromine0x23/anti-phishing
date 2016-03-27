#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
do ($ = jQuery) ->
	$.extend true, $.fn.dataTable.defaults.oLanguage,
		sEmptyTable: '没有数据'
		sInfo: '显示 _START_ 到 _END_ 条记录，共 _TOTAL_ 条记录'
		sInfoEmpty: '显示 0 到 0 条记录，共 0 条记录'
		sInfoFiltered: '(由 _MAX_ 条记录中中筛选)'
		sLengthMenu: '显示 _MENU_ 条记录'
		sLoadingRecords: '加载中……'
		sProcessing: '处理中……'
		sSearch: '搜索:'
		sZeroRecords: '没有找到符合条件的记录'
		oAria:
			sSortAscending: '：激活排序列升序'
			sSortDescending: '：激活排序列降序'
		oPaginate:
			sFirst: '首页'
			sLast: '末页'
			sPrevious: '上一页'
			sNext: '下一页'

