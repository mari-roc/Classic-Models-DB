class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees, id: false do |t|
      t.primary_key :employee_number, :integer
      t.string :last_name, null: false, limit: 50
      t.string :first_name, null: false, limit: 50
      t.string :extension, null: false, limit: 10
      t.string :email, null: false, limit: 100
      t.string :job_title, null: false, limit: 50
      t.integer :reports_to, limit: 11
      t.string :office_code, null: false, limit: 10
    end
    add_foreign_key :employees, :offices, column: :office_code, primary_key: :office_code
    add_foreign_key :employees, :employees, column: :reports_to, primary_key: :employee_number
  end
end
