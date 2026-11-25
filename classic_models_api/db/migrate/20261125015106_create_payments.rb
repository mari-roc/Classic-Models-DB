class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments, id: false, primary_key: [ :customer_number, :check_number ] do |t|
      t.integer :customer_number, null: false
      t.string :check_number, null: false, limit: 50
      t.date :payment_date, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
    end
    add_foreign_key :payments, :customers, column: :customer_number, primary_key: :customer_number
  end
end
