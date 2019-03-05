class Booking < ApplicationRecord
  belongs_to :user
  has_many :items, through: :booking_items
end
