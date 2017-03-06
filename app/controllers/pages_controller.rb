class PagesController < ApplicationController
  def index
  end

  def calendar
    event = Event.all
    event.each do |event|
      if (event.end_time + 28800) < Time.now
        event.destroy
        # alt: mark event to go to archives
      end
    end
    # @events = Event.search("eventCal", params[:search]).order(start_time: :asc).paginate(:page => params[:page], :per_page => 12)
    @events = Event.calSearch(params[:search]).order(start_time: :asc).paginate(:page => params[:page], :per_page => 12)

  end

  def resources
    # @resources = Resource.search("plantdb", params[:search]).order(binomial: :asc).paginate(:page => params[:page], :per_page => 12)
    @resources = Resource.plantSearch(params[:search]).order(binomial: :asc).paginate(:page => params[:page], :per_page => 12)
  end

  def map_florida
    @farms = FarmsMap.all
    @locations = []
    @descriptions = []
    @farms.each do |farm|
      @locations.push([farm.name, farm.latitude, farm.longitude])
      @descriptions.push(['<div class="info_content">' +
      "<div class='farmName'>#{farm.name}</div>" + "<p>#{farm.description}</p>" + '</div>'])
    end
  end


end
