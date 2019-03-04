class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :state
      t.date :starts_at
      t.date :ends_at
      t.string :product_sku
      t.monetize :amount
      t.jsonb :payment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
