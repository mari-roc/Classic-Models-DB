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

ActiveRecord::Schema[8.1].define(version: 2026_11_25_015525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "customers", primary_key: "customer_number", id: :serial, force: :cascade do |t|
    t.string "customer_name", limit: 50, null: false
    t.string "contact_last_name", limit: 50, null: false
    t.string "contact_first_name", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "address_line_1", limit: 50, null: false
    t.string "address_line_2", limit: 50
    t.string "city", limit: 50, null: false
    t.string "state", limit: 50
    t.string "postal_code", limit: 15
    t.string "country", limit: 50, null: false
    t.integer "sales_rep_employee_number"
    t.decimal "credit_limit", precision: 10, scale: 2
  end

  create_table "employees", primary_key: "employee_number", id: :serial, force: :cascade do |t|
    t.string "last_name", limit: 50, null: false
    t.string "first_name", limit: 50, null: false
    t.string "extension", limit: 10, null: false
    t.string "email", limit: 100, null: false
    t.string "job_title", limit: 50, null: false
    t.integer "reports_to"
    t.string "office_code", limit: 10, null: false
  end

  create_table "offices", primary_key: "office_code", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "city", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "address_line_1", limit: 50, null: false
    t.string "address_line_2", limit: 50
    t.string "state", limit: 50
    t.string "country", limit: 50, null: false
    t.string "postal_code", limit: 15, null: false
    t.string "territory", limit: 10, null: false
  end

  create_table "order_details", id: false, force: :cascade do |t|
    t.integer "order_number", null: false
    t.string "product_code", limit: 15, null: false
    t.integer "quantity_ordered", null: false
    t.decimal "price_each", precision: 10, scale: 2, null: false
    t.integer "order_line_number", limit: 2, null: false
    t.check_constraint "order_line_number >= 0", name: "order_line_number_non_negative"
  end

  create_table "orders", primary_key: "order_number", id: :serial, force: :cascade do |t|
    t.date "order_date", null: false
    t.date "required_date", null: false
    t.date "shipped_date"
    t.string "status", limit: 15, null: false
    t.text "comments"
    t.integer "customer_number", null: false
  end

  create_table "payments", id: false, force: :cascade do |t|
    t.integer "customer_number", null: false
    t.string "check_number", limit: 50, null: false
    t.date "payment_date", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
  end

  create_table "product_lines", primary_key: "product_line", id: { type: :string, limit: 50 }, force: :cascade do |t|
    t.string "text_description", limit: 4000
    t.text "html_description"
    t.binary "image"
  end

  create_table "products", primary_key: "product_code", id: { type: :string, limit: 15 }, force: :cascade do |t|
    t.string "product_name", limit: 70, null: false
    t.string "product_line", limit: 50, null: false
    t.string "product_scale", limit: 10, null: false
    t.string "product_vendor", limit: 50, null: false
    t.text "product_description", null: false
    t.integer "quantity_in_stock", limit: 2, null: false
    t.decimal "buy_price", precision: 10, scale: 2, null: false
    t.decimal "msrp", precision: 10, scale: 2, null: false
    t.check_constraint "quantity_in_stock >= 0", name: "quantity_in_stock_non_negative"
  end

  add_foreign_key "customers", "employees", column: "sales_rep_employee_number", primary_key: "employee_number"
  add_foreign_key "employees", "employees", column: "reports_to", primary_key: "employee_number"
  add_foreign_key "employees", "offices", column: "office_code", primary_key: "office_code"
  add_foreign_key "order_details", "orders", column: "order_number", primary_key: "order_number"
  add_foreign_key "order_details", "products", column: "product_code", primary_key: "product_code"
  add_foreign_key "orders", "customers", column: "customer_number", primary_key: "customer_number"
  add_foreign_key "payments", "customers", column: "customer_number", primary_key: "customer_number"
  add_foreign_key "products", "product_lines", column: "product_line", primary_key: "product_line"
end
