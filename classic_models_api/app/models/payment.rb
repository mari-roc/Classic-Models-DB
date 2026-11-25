class Payment < ApplicationRecord
    self.primary_key = [ :customer_number, :check_number ]
    belongs_to :customer, foreign_key: :customer_number
end
