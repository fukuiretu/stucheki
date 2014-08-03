# == Schema Information
#
# Table name: cheki_events
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  event_id     :integer
#  cheki_status :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ChekiEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  enum cheki_status: {stock: 1, join: 2, cancel: 3}
end
