class PagesController < ApplicationController

  def index
    @new_image = Image.new
    @image = Image.first
    gon.rabl :template => 'app/views/images/show.rabl'
  end

end
