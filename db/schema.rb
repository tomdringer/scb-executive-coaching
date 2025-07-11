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

ActiveRecord::Schema[7.1].define(version: 2024_12_31_165734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "blog_categories", id: :bigint, default: -> { "nextval('blogs_categories_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "blog_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blogs_categories_on_blog_id"
    t.index ["category_id"], name: "index_blogs_categories_on_category_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "category_id"
    t.string "author"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_id"
    t.bigint "resource_id"
    t.string "area"
    t.index ["blog_id"], name: "index_categories_on_blog_id"
    t.index ["resource_id"], name: "index_categories_on_resource_id"
  end

  create_table "coachings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intros", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
  end

  create_table "policies", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reorders", force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_categories", force: :cascade do |t|
    t.bigint "resource_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_resource_categories_on_category_id"
    t.index ["resource_id"], name: "index_resource_categories_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_upload"
    t.text "description"
    t.string "author"
    t.integer "category_id"
    t.string "link"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "name"
    t.integer "order"
    t.boolean "hide_menu"
    t.text "alignment"
    t.boolean "reviews"
    t.text "body"
    t.integer "position", default: 1, null: false
    t.boolean "show_on_home"
    t.string "custom_link"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_colour"
    t.string "title_size"
    t.string "body_text_colour"
    t.string "body_text_size"
    t.string "link_colour"
    t.boolean "hide_title"
    t.string "background_colour"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_categories", "blogs"
  add_foreign_key "blog_categories", "categories"
  add_foreign_key "blogs", "categories"
  add_foreign_key "categories", "blogs"
  add_foreign_key "categories", "resources"
  add_foreign_key "resource_categories", "categories"
  add_foreign_key "resource_categories", "resources"
end
