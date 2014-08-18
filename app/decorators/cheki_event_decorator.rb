module ChekiEventDecorator
  CHEKI_STATUS_NAMES = {"ストック" => "1", "参加" => "2", "キャンセル" => "3"}

  def select_tag_cheki_status()
    select_tag(
      "chekilist_#{id}",
      options_for_select(CHEKI_STATUS_NAMES, ChekiEvent.cheki_statuses[cheki_status]),
      class: "selectpicker",
      data: {
        style: "btn-info"
      }
    )
  end

  def ref_event(events)
    events.select { |e| e.id == event_id }.first
  end
end
