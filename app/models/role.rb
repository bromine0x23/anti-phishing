# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  code       :string(255)      not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_code  (code) UNIQUE
#

class Role < ActiveRecord::Base
	has_many :user_roles
	has_many :users, through: :user_roles
end
