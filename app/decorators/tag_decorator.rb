module TagDecorator
  def label_tag
    content_tag(
      :span,
      content,
      class: 'event_tag label label-default',
      id: "event_tag_#{id}"
    )
  end
end
