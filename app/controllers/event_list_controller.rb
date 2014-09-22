class EventListController < ApplicationController
  def show
    @events = Event.joins(:event_tag_maps)
    .includes(:cheki_events).references(:cheki_events)
    .gteq_started_at_or_all(params[:from_date])
    .lteq_started_at_or_all(params[:to_date])
    .merge(EventTagMap.where_tags_or_all(params[:event_tag]))
    .group(:service_type, :service_event_id)
    .order(created_at: :desc)
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
