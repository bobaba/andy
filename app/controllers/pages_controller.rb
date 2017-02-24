class PagesController < ApplicationController
  def index
  end

  def calendar
  end

  def resources
    @resources = Resource.search(params[:search])
  end

  def map_florida
  end

end
