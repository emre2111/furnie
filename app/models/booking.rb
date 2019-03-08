class Booking < ApplicationRecord
  belongs_to :user, optional: true
  has_many :booking_items
  has_many :items, through: :booking_items
  validates :ends_at, presence: true

  monetize :total_amount_cents

  def total_amount_cents
    items.sum { |item| item.product.price_cents } * (ends_at - starts_at).to_i
  end
end
