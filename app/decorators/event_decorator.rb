module EventDecorator
  def open_date
    "#{started_at} - #{ended_at}"
  end

  def link_to_website
    link_to link, link
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
end
