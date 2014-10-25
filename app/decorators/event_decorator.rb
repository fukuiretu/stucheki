module EventDecorator
  SERVICE_TYPE_NAMES = { 1 => 'ATND', 2 => 'Compass', 3 => 'DoorKeeper', 4 => 'Zussar' }

  def open_date
    from = started_at.nil? ? '' : Time.zone.parse(started_at.to_s).strftime('%Y-%m-%d %H:%M')
    to = ended_at.nil? ? '' : Time.zone.parse(ended_at.to_s).strftime('%Y-%m-%d %H:%M')
    "#{from} - #{to}"
  end

  def link_to_website
    link_to(link, link, target: :blank)
  end

  def label_tags
    tags = Tag.fetch(event_tag_maps.map(&:tag_id))
    tags.map do |t|
      content_tag(:span, t.content, class: 'label label-default')
    end.join(' ').html_safe
  end

  def excerpt_title
    truncate(title, length: 50, omission: '...')
  end

  def str_address
    return '未設定' if address.nil? || address.strip.blank?
    address
  end

  def event_name
    SERVICE_TYPE_NAMES[Event.service_types[service_type]]
  end
end
