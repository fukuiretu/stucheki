module EventDecorator
  def open_date
    "#{from_date} - #{to_date}"
  end

  def link_to_website
    link_to link, link
  end

  def label_tags
    tag.split(",").map{ |t|
      content_tag(:span, t, :class => 'label label-default')
    }.join(" ").html_safe
  end
end
