#= require bootbox.js
initBootbox = (bootbox) ->
	bootbox.setDefaults
		locale: 'zh_CN'
if @frameElement
	unless @parent.bootbox
		initBootbox(@parent.bootbox = @bootbox)
	@bootbox = @parent.bootbox
else
	initBootbox(@bootbox)