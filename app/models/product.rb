class Product < ApplicationRecord
  has_many :items , dependent: :destroy
  has_many :product_rooms
  has_many :rooms, through: :product_rooms
end
