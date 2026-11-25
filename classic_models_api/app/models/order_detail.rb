class OrderDetail < ApplicationRecord
    self.primary_key = [:order_number, :product_code]
    self.foreign_key = [:order_number, :product_code]
    self.check_constraints = :order_details, 'order_line_number >= 0', name: 'order_line_number_non_negative'
end
