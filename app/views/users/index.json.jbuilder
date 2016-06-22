json.array! @users do |user|
	json.id user.id
	json.username user.username
	json.name user.name
	json.telephone user.telephone
	json.email user.email
	json.role user.role.name
	json.href user_url(user)
end