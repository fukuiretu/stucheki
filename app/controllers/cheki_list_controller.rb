class ChekiListController < ApplicationController
  def show
    temp_cheki_events = ChekiEvent.where("user_id = ?", @current_user.id)

    @cheki_events_count = temp_cheki_events.count
    @cheki_events = temp_cheki_events.order("created_at DESC").page(params[:page]).per(5)
    @events = @cheki_events.includes(:event).map { |cheki_event| cheki_event.event }
  end

  def update
    cheki_event = ChekiEvent.find_by(id: params[:id].to_i, user_id: @current_user.id)
    cheki_event.cheki_status = params[:status].to_i
    cheki_event.save
  end

  def delete
    cheki_event = ChekiEvent.find_by(id: params[:id].to_i, user_id: @current_user.id)
    raise "Record to be deleted does not exist. id:#{params[:id]}" if cheki_event.nil?
    cheki_event.destroy

    flash[:success] = "削除が完了しました"
    redirect_to "/cheki_list"
  end
end
