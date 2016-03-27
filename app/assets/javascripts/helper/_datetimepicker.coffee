#= require helper/_moment
#= require bootstrap3-datetimepicker
do ($ = jQuery) -> $ ->
	$('.date-time-picker').datetimepicker
		locale: 'zh-cn'
		dayViewHeaderFormat: 'YYYY MMMM'
		showClear: true
	$('.date-time-picker[data-current="max"]').each (index, element) ->
		$(element).data('DateTimePicker').useCurrent(false).maxDate(moment())
	$('.date-time-picker[data-min^="#"]').each (index, element) ->
		$($(element).data('min')).on 'dp.change', (event) =>
			$(@).data('DateTimePicker').minDate(event.date)
	$('.date-time-picker[data-max^="#"]').each (index, element) ->
		$($(element).data('max')).on 'dp.change', (event) =>
			$(@).data('DateTimePicker').maxDate(event.date || moment())