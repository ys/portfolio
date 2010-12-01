class CreatePhotosRecipesJoin < ActiveRecord::Migration
  def self.up
    create_table :photos_recipes, :id => false do |t|
      t.integer :photo_id
      t.integer :recipe_id
    end
  end

  def self.down
    drop_table :photos_recipes
  end
end