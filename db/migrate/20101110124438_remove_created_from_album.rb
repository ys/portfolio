class RemoveCreatedFromAlbum < ActiveRecord::Migration
  def self.up
    remove_column :albums, :created
  end

  def self.down
    add_column :albums, :created, :date
  end
end
