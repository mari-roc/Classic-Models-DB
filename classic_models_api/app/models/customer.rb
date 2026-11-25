class Customer < ApplicationRecord
    self.primary_key = :customer_number
    belongs_to :sales_rep, class_name: "Employee", foreign_key: :sales_rep_employee_number, optional: true
    has_many :orders, foreign_key: :customer_number
    has_many :payments, foreign_key: :customer_number
end
