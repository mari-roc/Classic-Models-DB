class CreateOrderDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :order_details, id: false, primary_key: [:order_number, :product_code] do |t|
      t.integer :order_number, null: false
      t.string :product_code, null: false, limit: 15
      t.integer :quantity_ordered, null: false
      t.decimal :price_each, precision: 10, scale: 2
      t.integer :order_line_number, null: false
      add_foreign_key :order_details, :orders, column: :order_number, primary_key: :order_number
      add_foreign_key :order_details, :products, column: :product_code, primary_key: :product_code
    end
  end
end
