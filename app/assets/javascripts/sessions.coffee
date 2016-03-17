#= require toastr
do ($ = jQuery) -> $ ->
	toastr.options.positionClass = 'toast-top-center'
	toastr.options.newestOnTop = true
	toastr.options.progressBar = true
	$('#login').on 'ajax:success', (event, data, status, xhr) ->
		if (data.status)
			window.location.href = '/'
		else
			toastr.error(data.message)