json.reports @reports do |report|
	json.id report.id
	json.url report.url.to_s
	json.origin report.origin.name
	json.status report.status.name
	json.found_time report.found_time
	json.report_time report.report_time
	json.href report_url(report)
end