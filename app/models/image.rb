class Image < ActiveRecord::Base
  attr_accessible :description, :height, :path, :taken_at, :title, :width
end
