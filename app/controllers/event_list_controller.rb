class EventListController < ApplicationController
  def show
    @events = Event.all.page(params[:page]).per(5)
  end
end
