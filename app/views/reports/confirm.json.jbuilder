if @report.errors.empty?
	json.status true
	json.message translate('reports.confirm.success')
else
	json.status false
	json.message translate('reports.confirm.failed') % @report.errors.messages.values.first.first
end