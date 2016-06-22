if @user and @user.destroy
	json.status true
	json.message translate('users.destroy.success')
else
	json.status false
	json.message translate('users.destroy.failed') % @user.errors.messages.values.first.first
end