class PagesController < ApplicationController
  def index
  end

  def calendar
    @events = Event.search("eventCal", params[:search])
    @events = @events.sort_by {|obj| obj.start_time}

  end

  def resources
    @resources = Resource.search("plantdb", params[:search])
  end

  def map_florida
  end

end
