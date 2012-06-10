class AddSlugToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :slug, :string
  end
end
