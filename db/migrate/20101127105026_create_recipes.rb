class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :name
      t.integer :difficulty
      t.integer :preparation
      t.integer :cookingTime

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
