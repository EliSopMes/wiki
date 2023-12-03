# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_28_153837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "developers", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_developers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "event_type"
    t.bigint "booker_id"
    t.bigint "tdl_id"
    t.bigint "adl_id"
    t.integer "pre_number_of_guests"
    t.integer "invoice_status", default: 0
    t.text "schedule"
    t.text "deliveries"
    t.text "pick_ups"
    t.integer "get_in"
    t.text "get_in_info"
    t.text "set_up_info"
    t.integer "fire_place", default: 0
    t.boolean "self_payment"
    t.text "gastro_info"
    t.integer "catering", default: 0
    t.text "catering_info"
    t.text "staff_info"
    t.text "security_info"
    t.string "fire_watch"
    t.integer "cloakroom"
    t.text "cloakroom_info"
    t.text "other_info"
    t.text "technical_info"
    t.integer "post_number_of_guests"
    t.text "post_event_info"
    t.text "box_office_info"
    t.text "broken_info"
    t.text "external_staff_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organizer_id"
    t.boolean "canceled", default: false
    t.index ["adl_id"], name: "index_events_on_adl_id"
    t.index ["booker_id"], name: "index_events_on_booker_id"
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
    t.index ["tdl_id"], name: "index_events_on_tdl_id"
  end

  create_table "events_rooms", id: false, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "room_id"
    t.index ["event_id"], name: "index_events_rooms_on_event_id"
    t.index ["room_id"], name: "index_events_rooms_on_room_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "name"
    t.string "contact_person"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_type", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.datetime "birthday"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "developers", "users"
  add_foreign_key "events", "organizers"
  add_foreign_key "events", "users", column: "adl_id"
  add_foreign_key "events", "users", column: "booker_id"
  add_foreign_key "events", "users", column: "tdl_id"
end
