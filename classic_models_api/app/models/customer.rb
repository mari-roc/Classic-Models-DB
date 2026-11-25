class Customer < ApplicationRecord
    self.primary_key = :customer_number
    self.foreign_key = :sales_rep_employee_number
end
