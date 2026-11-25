class Payment < ApplicationRecord
    self.primary_key = [:customer_number, :check_number]
    self.foreign_key = :customer_number
end
