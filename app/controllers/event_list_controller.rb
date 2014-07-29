class EventListController < ApplicationController
  def show
    @event_count = Event.count
    @events = Event.all.page(params[:page]).per(5)
  end
end
