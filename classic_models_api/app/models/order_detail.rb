class OrderDetail < ApplicationRecord
    self.primary_key = [ :order_number, :product_code ]
    belongs_to :order, foreign_key: :order_number
    belongs_to :product, foreign_key: :product_code
end
