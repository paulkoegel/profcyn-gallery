class ImagesController < ApplicationController

  def index
    @location = Location.find_by_country(params[:location_id] || 'taiwan')
    @images = @location.images.limit(10)
    gon.images = @images
    gon.rabl :template => 'app/views/images/index.rabl'
  end

  def show
  end

end
