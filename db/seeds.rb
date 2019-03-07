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
  # some beds
 {
  name:                 'MJÖLVIK',
  sku:                  '1948292030',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/mjolvik-boxspringbett-beige__0373793_PE553241_S4.JPG',
  style:                'classic',
  material:             'fabric',
  product_category:     'bed',
  price_cents:          300
},
 {
  name:                 'LEIRVIK',
  sku:                  '5248289032',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/leirvik-bettgestell-wei-__0555081_PE660118_S4.JPG',
  style:                'vintage',
  material:             'metal',
  product_category:     'bed',
  price_cents:          100
},
 {
  name:                 'DELAKTIG',
  sku:                  '2579073211',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/delaktig-bettgestell-kopfteil-beistellti__0660300_PE711012_S4.JPG',
  style:                'modern',
  material:             'wood',
  product_category:     'bed',
  price_cents:          200
},
 {
  name:                 'HEMNES',
  sku:                  '9837492030',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/hemnes-bettgestell-mit-schubladen__0448720_PE598347_S4.JPG',
  style:                'classic',
  material:             'wood',
  product_category:     'bed',
  price_cents:          300
},
# some tables
 {
  name:                 'LERHAMN',
  sku:                  '4832462220',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/lerhamn-tisch__0238243_PE377691_S4.JPG',
  style:                'classic',
  material:             'wood',
  product_category:     'chair',
  price_cents:          300
},
]

Product.create!(products_attributes)

10.times do
  Item.create({ product_id: Product.find_by(sku: '1948292030').id})
end

10.times do
  Item.create({ product_id: Product.find_by(sku: '5248289032').id})
end

10.times do
  Item.create({ product_id: Product.find_by(sku: '2579073211').id})
end

10.times do
  Item.create({ product_id: Product.find_by(sku: '9837492030').id})
end

10.times do
  Item.create({ product_id: Product.find_by(sku: '4832462220').id})
end

puts 'Finished!'
