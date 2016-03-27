if @report.save
	json.status true
	json.message translate('reports.create.success')
	response.status = :created
else
	json.status false
	json.message translate('reports.create.failed') % @report.errors.messages.values.first.first
end