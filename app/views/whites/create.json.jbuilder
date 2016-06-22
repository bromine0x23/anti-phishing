if @white.save
	json.status true
	json.message translate('whites.create.success')
	response.status = :created
else
	json.status false
	json.message translate('whites.create.failed') % @white.errors.messages.values.first.first
end