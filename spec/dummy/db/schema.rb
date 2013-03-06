# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130305082228) do

  create_table "loblaw_attachments", :force => true do |t|
    t.integer  "mailbox_id"
    t.integer  "message_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "mime_type"
    t.integer  "position"
    t.integer  "file_size"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "loblaw_conversations", :force => true do |t|
    t.integer  "starter_id"
    t.string   "title"
    t.string   "permalink"
    t.integer  "status"
    t.string   "token"
    t.datetime "wrapped_up_at"
    t.integer  "messages_count",     :default => 0
    t.integer  "views_count",        :default => 0
    t.integer  "participants_count", :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "loblaw_graphs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loblaw_mailboxes", :force => true do |t|
    t.integer  "mailboxable_id"
    t.string   "mailboxable_type"
    t.datetime "checked_at"
    t.string   "time_zone"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "loblaw_messages", :force => true do |t|
    t.integer  "mailbox_id"
    t.integer  "voice_id"
    t.integer  "conversation_id"
    t.text     "reference_ids"
    t.string   "subject"
    t.text     "body"
    t.integer  "number"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "loblaw_users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loblaw_voices", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "graph_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
