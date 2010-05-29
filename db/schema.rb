# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100529104438) do

  create_table "documents", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpx_identifiers", :force => true do |t|
    t.string  "identifier", :null => false
    t.integer "user_id",    :null => false
    t.text    "raw"
  end

  add_index "rpx_identifiers", ["identifier"], :name => "index_rpx_identifiers_on_identifier", :unique => true

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["ancestry"], :name => "index_sections_on_ancestry"

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
