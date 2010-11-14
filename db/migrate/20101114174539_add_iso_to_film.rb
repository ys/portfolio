class AddIsoToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :iso, :string
  end

  def self.down
    remove_column :films, :iso
  end
end
