class Product < ApplicationRecord
    self.primary_key = :product_code
    belongs_to :product_line, foreign_key: :product_line
    has_many :order_details, foreign_key: :product_code
end
