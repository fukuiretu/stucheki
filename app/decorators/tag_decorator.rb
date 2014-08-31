module TagDecorator
  def label_tag()
    content_tag(:span, content, :class => 'event_tag label label-default')
  end
end
