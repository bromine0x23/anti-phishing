if @report.errors.empty?
	json.status true
	json.message translate('reports.update.success')
else
	json.status false
	json.message translate('reports.update.failed') % @report.errors.messages.values.first.first
end