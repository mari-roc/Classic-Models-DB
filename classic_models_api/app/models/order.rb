class Order < ApplicationRecord
    self.primary_key = :order_number
    belongs_to :customer, foreign_key: :customer_number
    has_many :order_details, foreign_key: :order_number
end
