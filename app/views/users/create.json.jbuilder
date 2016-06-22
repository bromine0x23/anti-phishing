if @user.save
	json.status true
	json.message translate('users.create.success')
	response.status = :created
else
	json.status false
	json.message translate('users.create.failed') % @user.errors.messages.values.first.first
end