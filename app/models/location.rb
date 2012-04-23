class Location < ActiveRecord::Base
  attr_accessible :city, :country, :kind, :region
  has_many :images
end
