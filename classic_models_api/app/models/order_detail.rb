class OrderDetail < ApplicationRecord
    self.primary_key = [:order_number, :product_code]
    belongs_to :order, foreign_key: :order_number
    belongs_to :product, foreign_key: :product_code
    self.check_constraints = :order_details, 'order_line_number >= 0', name: 'order_line_number_non_negative'
end
