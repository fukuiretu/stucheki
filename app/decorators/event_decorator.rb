module EventDecorator
  def open_date
    "#{started_at} - #{ended_at}"
  end

  def link_to_website
    link_to link, link
  end

  def label_tags
    tag.split(",").map{ |t|
      content_tag(:span, t, :class => 'label label-default')
    }.join(" ").html_safe
  end

  def excerpt_title
    if title.length > 50
      title.slice!(0, 50) + "..."
    else
      title
    end
  end
end
