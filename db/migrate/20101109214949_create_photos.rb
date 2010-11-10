class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.date :added
      t.date :taken
      t.boolean :xpro
      t.string :url
      t.string :thumbnailUrl
      t.references :camera
      t.references :film

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
