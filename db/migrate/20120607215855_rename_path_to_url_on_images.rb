class RenamePathToUrlOnImages < ActiveRecord::Migration
  def change
    rename_column :images, :path, :url
  end
end
