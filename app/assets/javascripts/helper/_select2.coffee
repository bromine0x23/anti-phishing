#= require select2/select2
#= require select2/i18n/zh-CN
do ($ = jQuery) -> $ ->
	$('.select2 select').select2
		minimumResultsForSearch: Infinity
		theme: 'bootstrap'
	$(':reset').on 'click', (event) ->
		event.preventDefault()
		form = $(@).closest('form')
		form.get(0).reset()
		form.find('.select2 select').trigger('change')