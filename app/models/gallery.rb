# encoding: UTF-8

class Gallery < ActiveRecord::Base

  has_many :images

  before_validation :create_slug

  validates :name, :presence => true
  validates :slug, :presence => true

  private
 
    def create_slug
      self.slug = self.name.underscore.parameterize(sep = '-')
    end

end
