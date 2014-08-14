class ChekiListController < ApplicationController
  def show
  end

  def update_status
    cheki_event = ChekiEvent.find_by(id: params[:id].to_i, user_id: @current_user.id)
    cheki_event.cheki_status = params[:status].to_i
    cheki_event.save
  end

  def delete
    cheki_event = ChekiEvent.find_by(id: params[:id].to_i, user_id: @current_user.id)
    unless cheki_event.nil?
      cheki_event.destroy
    end

    flash[:success] = "削除が完了しました"
    redirect_to "/cheki_list"
    # redirect_to "/cheki_list", :success => "表示したいメッセージ"
  end
end
