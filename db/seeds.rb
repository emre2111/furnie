# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './lib/tasks/scrape'

puts 'Cleaning database...'

ProductRoom.destroy_all
puts 'Creating product rooms'

Product.destroy_all
puts 'Creating products...'

Item.destroy_all
puts 'Creating items...'

Room.destroy_all
puts 'Creating rooms'



############################     Beds     #######################
material = ["realleather","textile", "solidwood", "syntheticleather"]
style = ["nature", "industrial", "scandinavian", "modern"]
beds = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/schlafzimmermoebel/betten-shop/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      beds <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                3,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'bed',
        price_cents:          product[:price_cents]
      }
    end
  end
end

############################     Tables     #######################
material = ["solidwood","glass", "woodsemisolid" ]
style = ["nature", "industrial", "scandinavian", "modern"]
tables = []
material.each do |m|
  style.each do |s|
    url = 'https://www.home24.de/kategorie/esszimmermoebel/esstische/?material=wood&styleFilter=modernStyle'
    scraper(url).each do |product|
      tables <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                3,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'table',
        price_cents:          product[:price_cents]
      }
    end
  end
end

############################     Chairs     #######################
material = ["realleather","textile", "plastic", "syntheticleather"]
style = ["nature", "industrial", "scandinavian", "modern"]
chairs = []
material.each do |m|
  style.each do |s|
    url = 'https://www.home24.de/kategorie/esszimmermoebel/esszimmerstuehle/?material=textile&styleFilter=modernStyle'
    scraper(url).each do |product|
      chairs <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                3,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'chair',
        price_cents:          product[:price_cents]
      }
    end
  end
end

############################     Sofas     #######################
material = ["realleather","textile", "syntheticleather"]
style = ["industrial", "scandinavian", "modern"]
sofas = []
material.each do |m|
  style.each do |s|
    url = 'https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/sofas/?material=textile&styleFilter=modernStyle'
    scraper(url).each do |product|
      sofas <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                3,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'sofa',
        price_cents:          product[:price_cents]
      }
    end
  end
end

Product.create!(beds)
Product.create!(tables)
Product.create!(chairs)
Product.create!(sofas)

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

##########   links the product category to the room category   ##########
##########     add to list if new category is added above      ##########

Product.all.where(category: 'bed').each do  |product|
   product.rooms << Room.find_by(name: 'bedroom')
end

Product.all.where(category: 'table').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'table').each do  |product|
   product.rooms << Room.find_by(name: 'kitchen')
end

Product.all.where(category: 'chair').each do  |product|
   product.rooms << Room.find_by(name: 'kitchen')
end

Product.all.where(category: 'chair').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'sofa').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

########## creates 3 items for each product ##########
##########          DO NOT CHANGE           ##########
Product.all.each do |product|
  3.times do
    Item.create(product_id: product.id)
  end
end
##########          DO NOT CHANGE           ##########

puts 'Finished!'
