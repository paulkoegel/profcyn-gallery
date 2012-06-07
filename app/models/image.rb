class Image < ActiveRecord::Base
  attr_accessible :description, :height, :url, :taken_at, :title, :width, :location
  belongs_to :location
end
