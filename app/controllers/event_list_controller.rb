class EventListController < ApplicationController
  def show
    temp_event = Event.search(params[:from_date], params[:to_date], params[:event_tag])
    @event_count = temp_event.count
    @events = temp_event.merge_cheki_events
                .order(created_at :desc)
                .page(params[:page])
                .per(Settings.pager_max_num.to_i)
  end

  def stock
    ChekiEvent.create(
      user_id: @current_user.id,
      event_id: params[:id],
      cheki_status: ChekiEvent.cheki_statuses[:stock]
    )

    flash[:success] = 'ストックが完了しました。ちぇきリストから参照してください'
    redirect_to '/event_list'
  end
end
