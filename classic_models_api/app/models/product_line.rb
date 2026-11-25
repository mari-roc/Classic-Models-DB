class ProductLine < ApplicationRecord
    self.primary_key = :product_line
    has_many :products, foreign_key: :product_line
end
