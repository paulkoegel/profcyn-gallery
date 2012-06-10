class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @galleries = Gallery.all
    @gallery = @galleries.find{|e| e.slug == params[:id]}
    gon.gallery = @gallery
    gon.images = @gallery.images
  end

end
