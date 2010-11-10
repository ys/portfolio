class RemoveAddedFromPhoto < ActiveRecord::Migration
  def self.up
    remove_column :photos, :added
  end

  def self.down
    add_column :photos, :added, :date
  end
end
