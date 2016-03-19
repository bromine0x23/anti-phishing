# == Schema Information
#
# Table name: statuses
#
#  id     :integer          not null, primary key
#  code   :string(255)      not null
#  name   :string(255)
#  remark :string(255)
#
# Indexes
#
#  index_statuses_on_code  (code) UNIQUE
#

#
# State Transition:
#
#                                    +------------------+
#                                    |                  |
#   +---------+       +----------+   |   +----------+   |   +--------+
#   | pending +---+---> reported +---+---> accepted +---+---> closed |
#   +---------+   |   +----------+   |   +----------+       +--------+
#                 |                  |
#                 |   +-------+      |   +----------+
#                 +---> false |      +---> rejected |
#                     +-------+          +----------+

class Status < ActiveRecord::Base
end
