class Employee < ApplicationRecord
    self.primary_key = :employee_number
    self.foreign_key = :office_code
    self.foreign_key = :reports_to
end
