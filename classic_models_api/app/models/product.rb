class Product < ApplicationRecord
    self.primary_key = :product_code
    self.foreign_key = :product_line
    self.check_constraint :quantity_in_stock, 'quantity_in_stock >= 0', name: 'quantity_in_stock_non_negative'
end
