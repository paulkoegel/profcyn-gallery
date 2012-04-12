class PagesController < ApplicationController

  def index
    @image = Image.first
    gon.rabl :template => 'app/views/images/show.rabl'
  end

end
