#= require iframe-resizer/iframeResizer
do ($ = jQuery) -> $ ->
	$('#page-container').iFrameResize
		checkOrigin: false,
		scrolling: true
	# $('iframe').each (_, iframe) ->
		# console.log(this, _, iframe)
		# console.log($('[data-deafult=true]'))
	# $('[data-deafult]')