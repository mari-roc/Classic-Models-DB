class Order < ApplicationRecord
    self.primary_key = :order_number
    self.foreign_key = :customer_number
end
