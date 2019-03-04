class ProductRoom < ApplicationRecord
  belongs_to :room
  belongs_to :product
end
