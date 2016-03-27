if @user
	json.status true
	json.message translate 'sessions.create.success'
	response.status = :created
else
	json.status false
	json.message translate 'sessions.create.failed'
end