class EventTagMap < ActiveRecord::Base
  belongs_to :event
  belongs_to :tag

  scope :where_tags_or_all, ->(tags) do
    return where(tag_id: tags.split(',')) if tags.present?
    all
  end
end
