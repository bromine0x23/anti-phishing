#= require helper/_bootbox
do ($ = jQuery, bootbox) -> $ ->
	$('#create-session-form').on 'ajax:success', (event, data, status, xhr) ->
		if data.status
			window.location.href = $('#submit-success').attr('href')
		else
			bootbox.alert
				message: data.message
				size: 'small'
				buttons:
					ok:
						className: 'btn-danger'