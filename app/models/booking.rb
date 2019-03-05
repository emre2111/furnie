class Booking < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items, through: :booking_items
  validates :ends_at, presence: true
end
