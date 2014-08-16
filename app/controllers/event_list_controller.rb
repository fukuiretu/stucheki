class EventListController < ApplicationController
  def show
    @event_count = Event.count
    @events = Event.all.page(params[:page]).per(10)
  end
end
