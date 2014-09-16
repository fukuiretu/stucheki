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

  scope :join_cheki_events, -> do
    joins('LEFT OUTER JOIN cheki_events on events.id = cheki_events.event_id')
    # .select("events.*, cheki_events.event_id")
  end

  scope :gteq_started_at_or_all, ->(from_date) do
    return where(arel_table[:started_at].gteq(from_date)) unless from_date.blank?
    all
  end

  scope :lteq_started_at_or_all, ->(to_date) do
    return where(arel_table[:started_at].lteq(to_date)) if to_date.present?
    all
  end

  # scope :search, ->(from_date, to_date, event_tags) {
  #   conditions = arel_table[:from_date].gteq(from_date) unless from_date.blank?
  #
  #   unless to_date.blank?
  #     conditions =
  #     if conditions.nil?
  #       arel_table[:from_date].lteq(to_date)
  #     else
  #       conditions.and(arel_table[:from_date].lteq(to_date))
  #     end
  #   end
  #
  #   unless event_tags.blank?
  #     event_tags.each do |event_tag|
  #       conditions =
  #       if conditions.nil?
  #         arel_table[:tag].matches("%" + event_tag + "%")
  #       else
  #         conditions.or(arel_table[:tag].matches("%" + event_tag + "%"))
  #       end
  #     end
  #   end
  #
  #   return all if conditions.nil?
  #
  #   where(conditions)
  # }
end
