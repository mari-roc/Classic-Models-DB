class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders, id: false do |t|
      t.primary_key :order_number, :integer
      t.date :order_date, null: false
      t.date :required_date, null: false
      t.date :shipped_date
      t.string :status, null: false, limit: 15
      t.string :comments
      t.integer :customer_number, null: false
      add_foreign_key :orders, :customers, column: :customer_number, primary_key: :customer_number
    end
  end
end
