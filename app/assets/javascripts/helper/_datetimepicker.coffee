#= require moment/moment
#= require moment/locale/zh-cn
#= require bootstrap3-datetimepicker
do ($ = jQuery) -> $ ->
	$('.date').datetimepicker
		locale: 'zh-cn'
		format: 'YYYY-MM-DD HH:mm:ss'
		dayViewHeaderFormat: 'YYYY MMMM'
		showClear: true
	$('.date[data-current="max"]').each (index, element) ->
		$(element).data('DateTimePicker').useCurrent(false).maxDate(moment())
	$('.date[data-min^="#"]').on 'dp.change', (event) ->
		$($(this).data('min')).data('DateTimePicker').minDate(event.date)
	$('.date[data-max^="#"]').on 'dp.change', (event) ->
		$($(this).data('max')).data('DateTimePicker').maxDate(event.date || moment())