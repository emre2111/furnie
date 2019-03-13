class Item < ApplicationRecord
  belongs_to :product
  has_many :booking_items, dependent: :destroy
  has_many :bookings, through: :booking_items
end
