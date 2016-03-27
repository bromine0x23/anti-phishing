#= require toastr
if frameElement
	parent.toastr = toastr unless parent.toastr
	@toastr = parent.toastr
else
	do ($ = jQuery) ->
		$.extend toastr.options,
			positionClass: 'toast-top-center'
			newestOnTop: true
			progressBar: true