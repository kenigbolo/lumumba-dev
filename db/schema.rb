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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161103185245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address", null: false
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "zip_code",       null: false
    t.string   "country",        null: false
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "image",       null: false
    t.text     "description", null: false
    t.string   "author",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "top_post"
    t.boolean  "valid_post"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "designs", force: :cascade do |t|
    t.string   "image",                           null: false
    t.string   "image_desc",                      null: false
    t.string   "first_garment_model_design",      null: false
    t.string   "first_garment_print_design",      null: false
    t.string   "first_garment_technical_design",  null: false
    t.string   "first_garment_desc",              null: false
    t.string   "second_garment_model_design",     null: false
    t.string   "second_garment_print_design",     null: false
    t.string   "second_garment_technical_design", null: false
    t.string   "second_garment_desc",             null: false
    t.string   "third_garment_model_design",      null: false
    t.string   "third_garment_print_design",      null: false
    t.string   "third_garment_technical_design",  null: false
    t.boolean  "for_competition",                 null: false
    t.boolean  "competition",                     null: false
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "third_garment_desc"
    t.string   "first_garment_design"
    t.string   "second_garment_design"
    t.string   "third_garment_design"
    t.index ["user_id"], name: "index_designs_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.text     "message",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "notice",     null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.string   "size",       null: false
    t.string   "color",      null: false
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_number",                   null: false
    t.string   "payment_method"
<<<<<<< HEAD
    t.decimal  "total_amount"
=======
    t.decimal  "total_amount",                   null: false
>>>>>>> staging
    t.string   "status",                         null: false
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.decimal  "vat"
    t.integer  "shipping"
    t.string   "transaction_id"
    t.decimal  "sub_total",      default: "0.0"
    t.decimal  "shipping_cost",  default: "0.0"
    t.string   "slug"
    t.index ["slug"], name: "index_orders_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "main_image",                       null: false
    t.string   "first_thumbnail",                  null: false
    t.string   "second_thumbnail",                 null: false
    t.string   "third_thumbnail",                  null: false
    t.decimal  "price",                            null: false
    t.string   "description",                      null: false
    t.string   "designer",                         null: false
    t.boolean  "preview",          default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "slug"
    t.index ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "country",    null: false
    t.decimal  "vat_rate",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "phone_number"
    t.string   "description"
    t.string   "slug"
    t.string   "image_status"
    t.string   "avatar"
    t.string   "location"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "designs", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
end
