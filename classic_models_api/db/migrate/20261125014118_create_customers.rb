class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers, id: false do |t|
      t.primary_key :customer_number, :integer
      t.string :customer_name, null: false, limit: 50
      t.string :contact_last_name, null: false, limit: 50
      t.string :contact_first_name, null: false, limit: 50
      t.string :phone, null: false, limit: 50
      t.string :address_line_1, null: false, limit: 50
      t.string :address_line_2, limit: 50
      t.string :city, null: false, limit: 50
      t.string :state, limit: 50
      t.string :postal_code, limit: 15
      t.string :country, null: false, limit: 50
      t.integer :sales_rep_employee_number
      t.decimal :credit_limit, precision: 10, scale: 2
      add_foreign_key :customers, :employees, column: :sales_rep_employee_number, primary_key: :employee_number
    end
    drop_table :customers
  end
end
