class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products, id: false do |t|
      t.primary_key :product_code, :string, limit: 15
      t.string :product_name, null: false, limit: 70
      t.string :product_line, null: false, limit: 50
      t.string :product_scale, null: false, limit: 10
      t.string :product_vendor, null: false, limit: 50
      t.text :product_description, null: false
      t.decimal :quantity_in_stock, precision: 10, scale: 0
      t.decimal :buy_price, precision: 10, scale: 2
      t.decimal :msrp, precision: 10, scale: 2
    end
    add_foreign_key :products, :product_lines, column: :product_line, primary_key: :product_line
  end
end
