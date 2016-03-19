json.array! @whites do |white|
	json.id white.id
	json.url white.url
	json.disposer white.disposer.name
	json.time white.created_at
	json.href white_url(white)
end