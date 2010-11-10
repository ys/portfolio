class CreateCameras < ActiveRecord::Migration
  def self.up
    create_table :cameras do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.string :nickname

      t.timestamps
    end
  end

  def self.down
    drop_table :cameras
  end
end
