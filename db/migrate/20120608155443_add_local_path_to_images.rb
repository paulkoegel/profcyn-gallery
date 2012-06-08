class AddLocalPathToImages < ActiveRecord::Migration
  def change
    add_column :images, :local_path, :string
  end
end
