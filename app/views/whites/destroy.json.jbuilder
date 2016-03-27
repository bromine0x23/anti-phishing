if @white and @white.destroy
	json.status true
	json.message translate('whites.destroy.success')
else
	json.status false
	json.message translate('whites.destroy.failed') % @white.errors.messages.values.first.first
end