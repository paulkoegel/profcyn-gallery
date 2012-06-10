class Image < ActiveRecord::Base
  attr_accessible :description, :height, :url, :taken_at, :title, :width, :location, :gallery, :local_path

  belongs_to :location
  belongs_to :gallery
end
