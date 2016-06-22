if @report.save
	json.status true
	json.message translate('screenshots.create.success')
	response.status = :created
else
	json.status false
	json.message translate('screenshots.create.failed') % @report.errors.messages.values.first.first
end