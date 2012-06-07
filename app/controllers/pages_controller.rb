class PagesController < ApplicationController

  def index
    # @new_image = Image.new
    # @image = Image.first
    @location = Location.find_by_country('taiwan')
    @images = @location.images
    gon.rabl :template => 'app/views/images/show.rabl'
  end

end
