# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  service_type     :integer
#  service_event_id :integer
#  title            :string(255)
#  tag              :string(255)
#  started_at       :datetime
#  ended_at         :datetime
#  place            :string(255)
#  link             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Event < ActiveRecord::Base
  has_many :cheki_events
  has_many :users, through: :cheki_events
  has_many :event_tag_maps

  enum service_type: { atnd: 1, compass: 2, door_keeper: 3, zussar: 4 }

  scope :gteq_started_at_or_all, ->(from_date) do
    where(arel_table[:started_at].gteq(from_date)) if from_date.present?
  end

  scope :lteq_started_at_or_all, ->(to_date) do
    where(arel_table[:started_at].lteq(to_date)) if to_date.present?
  end
end
