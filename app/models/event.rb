# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  origin_type :integer
#  title       :string(255)
#  description :string(255)
#  tag         :string(255)
#  from_date   :datetime
#  to_date     :datetime
#  place       :string(255)
#  link        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  has_many :cheki_events
  has_many :users, through: :cheki_events
end