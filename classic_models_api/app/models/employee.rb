class Employee < ApplicationRecord
    self.primary_key = :employee_number
    belongs_to :office, foreign_key: :office_code
    belongs_to :manager, class_name: 'Employee', foreign_key: :reports_to, optional: true
    has_many :subordinates, class_name: 'Employee', foreign_key: :reports_to
    has_many :customers, class_name: 'Customer', foreign_key: :sales_rep_employee_number
end
