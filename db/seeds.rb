# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'


ProductRoom.destroy_all
puts 'Creating product rooms'

Product.destroy_all
puts 'Creating products...'

Item.destroy_all
puts 'Creating items...'

Room.destroy_all
puts 'Creating rooms'



products_attributes = [
  # some beds
  {
    name:                 'MJOELVIK',
    sku:                  '1948292030',
    stock:                10,
    photo:                'https://www.ikea.com/de/de/images/products/mjolvik-boxspringbett-beige__0373793_PE553241_S4.JPG',
    style:                'classic',
    material:             'fabric',
    category:             'bed',
    price_cents:          300
  },
  {
    name:                 'LEIRVIK',
    sku:                  '5248289032',
    stock:                10,
    photo:                'https://www.ikea.com/de/de/images/products/leirvik-bettgestell-wei-__0555081_PE660118_S4.JPG',
    style:                'vintage',
    material:             'metal',
    category:             'bed',
    price_cents:          100
  },
  {
    name:                 'DELAKTIG',
    sku:                  '2579073211',
    stock:                10,
    photo:                'https://www.ikea.com/de/de/images/products/delaktig-bettgestell-kopfteil-beistellti__0660300_PE711012_S4.JPG',
    style:                'modern',
    material:             'wood',
    category:             'bed',
    price_cents:          200
  },
  {
    name:                 'HEMNES',
    sku:                  '9837492030',
    stock:                10,
    photo:                'https://www.ikea.com/de/de/images/products/hemnes-bettgestell-mit-schubladen__0448720_PE598347_S4.JPG',
    style:                'classic',
    material:             'wood',
    category:             'bed',
    price_cents:          300
  },
# some tabbles
{
  name:                 'LERHAMN',
  sku:                  '4832462220',
  stock:                10,
  photo:                'https://www.ikea.com/de/de/images/products/lerhamn-tisch__0238243_PE377691_S4.JPG',
  style:                'classic',
  material:             'wood',
  category:             'table',
  price_cents:          300
},
{
  name:                 'FRANCOIS',
  sku:                  '2846467450',
  stock:                10,
  photo:                'https://cdn.connox.de/m/100107/209395/media/hay/Copenhague-Deux/Tisch/Hay-Copenhague-CPH-Deux-220-Tisch-98-cm-lackierte-Eiche-mit-Linoleum-hellgrau-frei.jpg',
  style:                'classic',
  material:             'wood',
  category:             'table',
  price_cents:          300
}
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

10.times do
  Item.create({ product_id: Product.find_by(sku: '2846467450').id})
end

rooms_attributes = [
  # some beds
  {
    name:                 'bedroom'
  },
  {
    name:                 'kitchen'
  },
  {
    name:                 'living room'
  },
  {
    name:                 'other'
  }
]

Room.create!(rooms_attributes)

Product.find_by(name: 'LERHAMN').rooms << Room.find_by(name: 'kitchen')
Product.find_by(name: 'LERHAMN').rooms << Room.find_by(name: 'living room')
Product.find_by(name: 'FRANCOIS').rooms << Room.find_by(name: 'other')


Product.find_by(name: 'MJOELVIK').rooms << Room.find_by(name: 'bedroom')
Product.find_by(name: 'LEIRVIK').rooms << Room.find_by(name: 'bedroom')
Product.find_by(name: 'DELAKTIG').rooms << Room.find_by(name: 'bedroom')
Product.find_by(name: 'HEMNES').rooms << Room.find_by(name: 'bedroom')

puts 'Finished!'
