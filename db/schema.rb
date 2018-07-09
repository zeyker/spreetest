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

ActiveRecord::Schema.define(version: 20180429194043) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "visits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles22", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "visits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "uuid"
    t.string "tbk_token_ws"
    t.string "tbk_accounting_date"
    t.string "tbk_buy_order"
    t.string "tbk_card_number"
    t.string "tbk_commerce_code"
    t.string "tbk_authorization_code"
    t.string "tbk_payment_type_code"
    t.string "tbk_response_code"
    t.string "tbk_transaction_date"
    t.string "tbk_vci"
    t.string "tbk_session_id"
    t.string "tbk_card_expiration_date"
    t.string "tbk_shares_number"
    t.string "tbk_transaction_id"
    t.string "tbk_credit_card_type"
    t.integer "amount"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tbk_token_ws"], name: "index_orders_on_tbk_token_ws"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "tbk_user"
  end

end
