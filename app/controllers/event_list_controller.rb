class EventListController < ApplicationController
  def show
    @event_count = Event.count
    @events = Event.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def stock
    ChekiEvent.create(
      user_id: @current_user.id,
      event_id: params[:id],
      cheki_status: ChekiEvent.cheki_statuses[:stock]
    )

    flash[:success] = "ストックが完了しました。ちぇきリストから参照してください。"
    redirect_to '/event_list'
  end
end
