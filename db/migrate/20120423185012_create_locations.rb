class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :region
      t.string :kind

      t.timestamps
    end
  end
end
