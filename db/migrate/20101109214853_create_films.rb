class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.string :type
      t.string :format
      t.string :brand
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end
