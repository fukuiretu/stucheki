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

  enum origin_type: {atnd: 1, compass: 2, door_keeper: 3, zussar: 4}

  scope :merge_cheki_events, -> {
    joins("LEFT OUTER JOIN cheki_events on events.id = cheki_events.event_id")
      .select("events.*, cheki_events.event_id")
  }

  scope :search, ->(from_date, to_date, event_tags) {
    conditions = arel_table[:from_date].gteq(from_date) unless from_date.blank?

    unless to_date.blank?
      conditions =
        if conditions.nil?
          arel_table[:from_date].lteq(to_date)
        else
          conditions.and(arel_table[:from_date].lteq(to_date))
        end
    end

    unless event_tags.blank?
      event_tags.each do |event_tag|
        conditions =
          if conditions.nil?
            arel_table[:tag].matches("%" + event_tag + "%")
          else
            conditions.or(arel_table[:tag].matches("%" + event_tag + "%"))
          end
      end
    end

    return all if conditions.nil?

    where(conditions)
  }
end
