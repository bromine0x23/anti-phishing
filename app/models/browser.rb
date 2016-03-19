# == Schema Information
#
# Table name: browsers
#
#  id   :integer          not null, primary key
#  code :string(255)      not null
#  name :string(255)
#
# Indexes
#
#  index_browsers_on_code  (code) UNIQUE
#

class Browser < ActiveRecord::Base
end
