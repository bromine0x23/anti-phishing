#= require bootbox
if @frameElement
	@parent.bootbox = @bootbox unless @parent.bootbox
	@bootbox = @parent.bootbox
else
	@bootbox.setDefaults
		locale: 'zh_CN'