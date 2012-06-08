class Image < ActiveRecord::Base
  attr_accessible :description, :height, :url, :taken_at, :title, :width, :location, :local_path
  belongs_to :location
end
