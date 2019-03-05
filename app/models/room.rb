class Room < ApplicationRecord
  has_many :product_rooms
  has_many :products, through: :product_rooms
end
