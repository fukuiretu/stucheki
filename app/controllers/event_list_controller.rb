class EventListController < ApplicationController
  def show
    @events = Event.all
  end
end
