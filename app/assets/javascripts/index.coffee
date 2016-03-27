#= require iframe-resizer/iframeResizer
#= require helper/_toastr
do ($ = jQuery) -> $ ->
	$('#page-container').iFrameResize
		checkOrigin: false
		scrolling: true
	do ->
		toggleSelector = $.AdminLTE.options.sidebarToggleSelector
		key = 'anti-phishing/index#sidebar-collapse'
		$(toggleSelector).trigger('click') if JSON.parse(localStorage.getItem(key))
		$(toggleSelector).on 'click', (event) ->
			localStorage.setItem(key, JSON.stringify($('body').hasClass('sidebar-collapse')))