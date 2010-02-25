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

ActiveRecord::Schema.define(:version => 20100225180011) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.string   "url"
    t.string   "text_selector"
    t.string   "author_selector"
    t.string   "location_selector"
    t.string   "posted_at_selector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "text"
    t.string   "author"
    t.string   "location"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
    t.string   "feed_type"
    t.integer  "category_id"
  end

  add_index "messages", ["category_id"], :name => "index_messages_on_category_id"

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "word_classifications", :force => true do |t|
    t.integer  "word_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_classifications", ["category_id"], :name => "index_word_classifications_on_category_id"
  add_index "word_classifications", ["word_id"], :name => "index_word_classifications_on_word_id"

  create_table "word_uses", :force => true do |t|
    t.integer  "word_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_uses", ["message_id"], :name => "index_word_uses_on_message_id"
  add_index "word_uses", ["word_id"], :name => "index_word_uses_on_word_id"

  create_table "words", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
