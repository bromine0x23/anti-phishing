# == Schema Information
#
# Table name: reports
#
#  id           :integer          not null, primary key
#  url          :string(255)      not null
#  loss         :string(255)      default("0")
#  region       :string(255)
#  origin_id    :integer          not null
#  way_id       :integer
#  system_id    :integer
#  browser_id   :integer
#  disposer_id  :integer          not null
#  status_id    :integer          default(1), not null
#  found_time   :datetime         not null
#  report_time  :datetime         not null
#  dispose_time :datetime
#  finish_time  :datetime
#  screenshot   :binary(16777215)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  fk_rails_1d127a16c7  (disposer_id)
#  fk_rails_53f7182c88  (status_id)
#  fk_rails_862054849d  (system_id)
#  fk_rails_b067cbe651  (way_id)
#  fk_rails_c44b45b8f2  (origin_id)
#  fk_rails_c8ae57fdf1  (browser_id)
#
# Foreign Keys
#
#  fk_rails_1d127a16c7  (disposer_id => users.id)
#  fk_rails_53f7182c88  (status_id => statuses.id)
#  fk_rails_862054849d  (system_id => systems.id)
#  fk_rails_b067cbe651  (way_id => ways.id)
#  fk_rails_c44b45b8f2  (origin_id => origins.id)
#  fk_rails_c8ae57fdf1  (browser_id => browsers.id)
#

class Report < ActiveRecord::Base
	validates :url, format: /(https?:\\\\)?(\w+\.)+\w+(\\.*)?/i
	belongs_to :status
	belongs_to :origin
	belongs_to :way
	belongs_to :system
	belongs_to :browser
	belongs_to :disposer, class_name: 'User'
end
