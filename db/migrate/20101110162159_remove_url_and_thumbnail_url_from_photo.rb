class RemoveUrlAndThumbnailUrlFromPhoto < ActiveRecord::Migration
  def self.up
    remove_column :photos, :url
    remove_column :photos, :thumbnailUrl
  end

  def self.down
    add_column :photos, :thumbnailUrl, :string
    add_column :photos, :url, :string
  end
end
