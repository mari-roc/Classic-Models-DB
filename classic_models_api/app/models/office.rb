class Office < ApplicationRecord
    self.primary_key = :office_code
    has_many :employees, foreign_key: :office_code
end
