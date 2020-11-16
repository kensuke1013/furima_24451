# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_09_052138) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comments", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "destinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "familiy_name", null: false
    t.string "first_mame_kana", null: false
    t.string "family_name_kana", null: false
    t.integer "post_code", null: false
    t.integer "prefecture_code", default: 0, null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_name"
    t.integer "phone_number", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_favorites_on_item_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "item_imgs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_imgs_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.bigint "genre_id", null: false
    t.bigint "itemstatus_id", null: false
    t.bigint "deliveryfee_id", null: false
    t.bigint "shipmentsource_id", null: false
    t.bigint "daystoship_id", null: false
    t.bigint "item_price_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "photo", null: false
    t.bigint "item", null: false
    t.bigint "draft", null: false
  end

  create_table "points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "size", null: false
    t.string "status", null: false
    t.integer "price", null: false
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "sns_authentications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.text "token"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sns_authentications_on_user_id"
  end

  create_table "todo_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "user_evalutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "review", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_user_evalutions_on_item_id"
    t.index ["user_id"], name: "index_user_evalutions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.date "birth_day", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "destinations", "users"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "item_imgs", "items"
  add_foreign_key "items", "users"
  add_foreign_key "points", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "sns_authentications", "users"
  add_foreign_key "todo_lists", "users"
  add_foreign_key "user_evalutions", "items"
  add_foreign_key "user_evalutions", "users"
end
