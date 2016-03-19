# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  fk_rails_318345354e  (user_id)
#  fk_rails_3369e0d5fc  (role_id)
#
# Foreign Keys
#
#  fk_rails_318345354e  (user_id => users.id)
#  fk_rails_3369e0d5fc  (role_id => roles.id)
#

class UserRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role
end
