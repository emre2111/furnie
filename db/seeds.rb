# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

Product.destroy_all
puts 'Creating products...'

Item.destroy_all
puts 'Creating items...'

products_attributes = [
 {
  name:                 'MJÖLVIK',
  sku:                  '1948292030',
  stock:                15,
  photo:                'https://www.ikea.com/de/de/images/products/mjolvik-boxspringbett-beige__0373793_PE553241_S4.JPG',
  style:                'classic',
  material:             'fabric',
  product_category:     'bed',
  price_cents:          10000
},
]

Product.create!(products_attributes)

15.times do
  Item.create({ product_id: Product.find_by(sku: '1948292030').id})
end

puts 'Finished!'
