json.array! @reports do |report|
	json.id report.id
	json.url report.url
	json.origin report.origin.name
	json.status report.status ? report.status.name : ''
	json.found_time report.found_time
	json.report_time report.report_time
	json.href report_url(report)
end