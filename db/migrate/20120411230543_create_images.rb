class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :path
      t.integer :width
      t.integer :height
      t.string :title
      t.text :description
      t.datetime :taken_at

      t.timestamps
    end
  end
end
