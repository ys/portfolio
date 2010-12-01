# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101201154050) do

  create_table "albums", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "albums_photos", :id => false, :force => true do |t|
    t.integer "album_id"
    t.integer "photo_id"
  end

  create_table "cameras", :force => true do |t|
    t.string    "name"
    t.string    "model"
    t.string    "brand"
    t.string    "nickname"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "films", :force => true do |t|
    t.string    "type"
    t.string    "format"
    t.string    "brand"
    t.string    "name"
    t.string    "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "iso"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "quantity"
    t.text     "desc"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "photos", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.date      "taken"
    t.boolean   "xpro"
    t.integer   "camera_id"
    t.integer   "film_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
    t.boolean   "published"
  end

  create_table "photos_recipes", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "recipe_id"
  end

  create_table "photos_tags", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "difficulty"
    t.integer  "preparation"
    t.integer  "cookingTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.text     "desc"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                               :default => "", :null => false
    t.string    "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string    "password_salt",                       :default => "", :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                       :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
