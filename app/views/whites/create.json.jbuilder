if @white.save
	json.status true
	json.message translate('.success')
	response.status = :created
else
	json.status false
	json.message translate('.failed')
end