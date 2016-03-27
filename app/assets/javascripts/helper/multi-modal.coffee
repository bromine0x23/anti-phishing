do ($ = jQuery, window) ->
	class MultiModal
		constructor: (element) ->
			@index = 0
		BASE_ZINDEX: 1020
		getMaxIndex = () ->
			modals = $('.modal:visible')
			if modals.length
				max_value = 0
				for modal in modals
					value = $(modal).data('modal-index')
					max_value = value if value > max_value
				index = max_value
			index || 0
		show: (target) ->
			$target = $(target)
			$target.data('modal-index', @index = getMaxIndex() + 1)
			window.setTimeout =>
				@adjustModal($target)
				@adjustBackdrop(@index)
		hidden: (target) ->
			if $('.modal:visible').length
				@adjustBackdrop()
				$('body').addClass('modal-open')
		adjustModal: ($target) ->
			$target.css('z-index', @BASE_ZINDEX + @index * 20 + 10)
		adjustBackdrop: (index = getMaxIndex()) ->
			$('.modal-backdrop').filter(':last').css('z-index', @BASE_ZINDEX + index * 20)

	$.fn.multiModal = class
		constructor: (method, target) ->
			@.each () ->
				$this = $(@)
				data = $this.data('multi-modal')
				$this.data('multi-modal', data = new MultiModal(@)) unless data
				data[method](target) if method
		@Constructor = MultiModal

	$(document).on 'show.bs.modal', (event) ->
		$(document).multiModal('show', event.target)
	$(document).on 'hidden.bs.modal', (event) ->
		$(document).multiModal('hidden', event.target)