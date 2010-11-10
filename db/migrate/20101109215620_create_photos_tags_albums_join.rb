class CreatePhotosTagsAlbumsJoin < ActiveRecord::Migration
  def self.up
    create_table :photos_tags, :id => false do |t|
      t.integer :photo_id
      t.integer :tag_id
    end
    create_table :albums_photos, :id => false do |t|
      t.integer :album_id
      t.integer :photo_id
    end
  end

  def self.down
    drop_table :photos_tags
    drop_table :albums_photos
  end
end