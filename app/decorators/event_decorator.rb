module EventDecorator
  def open_date
    "#{started_at} - #{ended_at}"
  end

  def link_to_website
    link_to link, link
  end

  def label_tags
    tag.split(',').map{ |t|
      content_tag(:span, t, class: 'label label-default')
    }.join(' ').html_safe
  end

  def excerpt_title
    truncate(title, length: 50, omission: '...')
  end
end
