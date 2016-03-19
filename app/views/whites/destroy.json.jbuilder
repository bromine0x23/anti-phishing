if @white and @white.destroy
	json.status true
	json.message translate('.success')
else
	json.status false
	json.message translate('.failed')
end