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

ActiveRecord::Schema.define(version: 2018_11_10_213158) do

  create_table "banners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "picture"
    t.text "description"
    t.string "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.index ["branch_id"], name: "index_banners_on_branch_id"
  end

  create_table "branchdirectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branchdirectors_on_branch_id"
    t.index ["user_id"], name: "index_branchdirectors_on_user_id"
  end

  create_table "branches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone", limit: 12
    t.string "email", limit: 30
    t.text "description"
    t.string "background"
    t.string "organization", limit: 150
    t.string "ogrn", limit: 15
    t.string "inn", limit: 15
    t.string "address", limit: 150
    t.string "director", limit: 50
    t.string "kpp", limit: 15
    t.string "region_kladr_id", limit: 15
    t.string "bik", limit: 9
    t.string "bank", limit: 150
    t.string "rs", limit: 20
    t.string "ks", limit: 20
  end

  create_table "cargos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100
    t.boolean "delicate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kladr_id", limit: 20
    t.string "region_kladr_id", limit: 20
  end

  create_table "coins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coin", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dt"
    t.bigint "cargo_id"
    t.integer "weight"
    t.float "volume"
    t.integer "amount"
    t.boolean "frail"
    t.boolean "oversized"
    t.string "from_city"
    t.string "to_city"
    t.string "shipper"
    t.string "shipper_person"
    t.string "shipper_phone"
    t.string "shipper_address"
    t.string "consignee"
    t.string "consignee_person"
    t.string "consignee_phone"
    t.string "consignee_address"
    t.string "payer"
    t.text "details"
    t.string "person"
    t.string "email"
    t.bigint "user_id"
    t.bigint "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kladr_from", limit: 13
    t.string "kladr_to", limit: 13
    t.bigint "status_id"
    t.string "code", limit: 20
    t.index ["cargo_id"], name: "index_orders_on_cargo_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "title_id"
    t.text "message"
    t.string "email", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "storages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "branch_id"
    t.string "address", limit: 150
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 10
    t.float "factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userroles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_userroles_on_role_id"
    t.index ["user_id"], name: "index_userroles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", limit: 20, default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 20
    t.string "family", limit: 20
    t.date "born"
    t.string "phone", limit: 12
    t.string "otch", limit: 20
    t.boolean "privacy"
    t.string "address", limit: 150
    t.string "region_kladr_id", limit: 15
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
