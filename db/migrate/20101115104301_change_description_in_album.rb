class ChangeDescriptionInAlbum < ActiveRecord::Migration
  def self.up
    change_column :albums, :description, :text
  end

  def self.down
    change_column :albums, :description, :string
  end
end
