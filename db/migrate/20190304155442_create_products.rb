class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :stock
      t.string :photo
      t.string :style
      t.string :material
      t.string :category

      t.timestamps
    end
  end
end
