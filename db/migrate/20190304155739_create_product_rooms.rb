class CreateProductRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :product_rooms do |t|
      t.references :room, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
