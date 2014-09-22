# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :event_tag_maps

  def self.fetch(ids = [])
    entities = Rails.cache.fetch(:tags, expires_in: 60.minutes) do
      Tag.all.order(content: :asc)
    end

    return entities if ids.empty?

    result = []
    entities.each do | entity |
      result << entity if ids.include?(entity.id)
    end
    result
  end
end
