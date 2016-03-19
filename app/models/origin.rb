# == Schema Information
#
# Table name: origins
#
#  id   :integer          not null, primary key
#  code :string(255)      not null
#  name :string(255)
#
# Indexes
#
#  index_origins_on_code  (code) UNIQUE
#

class Origin < ActiveRecord::Base
end
