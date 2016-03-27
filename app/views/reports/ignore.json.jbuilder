if @report.errors.empty?
	json.status true
	json.message translate('reports.ignore.success')
else
	json.status false
	json.message translate('reports.ignore.failed') % @report.errors.messages.values.first.first
end