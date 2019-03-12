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
puts 'Destroying product rooms'

Room.destroy_all
puts 'Destroying rooms'

BookingItem.destroy_all
puts 'Destroying items...'

Product.destroy_all
puts 'Destroying products...'

Item.destroy_all
puts 'Destroying items...'

puts 'Scraping furniture products, creating rooms and items.....'

############################     Beds     #######################
material = ["realleather", "textile", "solidwood", "syntheticleather"]
style = ["nature", "industrial", "scandinavian", "modern"]
beds = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/schlafzimmermoebel/betten-shop/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      beds <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'bed',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(beds)

############################     Tables     #######################
material = ["solidwood", "glass", "woodsemisolid" ]
style = ["nature", "industrial", "scandinavian", "modern"]
tables = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/esszimmermoebel/esstische/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      tables <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'table',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(tables)

############################     Chairs     #######################
material = ["realleather", "textile", "plastic", "syntheticleather"]
style = ["nature", "industrial", "scandinavian", "modern"]
chairs = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/esszimmermoebel/esszimmerstuehle/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      chairs <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'chair',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(chairs)

############################     Sofas     #######################
material = ["realleather", "textile", "syntheticleather"]
style = ["industrial", "scandinavian", "modern"]
sofas = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/sofas/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      sofas <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'sofa',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(sofas)

############################     wardrobe     #######################
material = ["realleather", "glass", "solidwood", "wood"]
style = ["nature","industrial", "scandinavian", "modern"]
wardrobes = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/schlafzimmermoebel/kleiderschraenke/?styleFilter=#{s}Style&material=#{m}"
    scraper(url).each do |product|
      wardrobes <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'wardrobe',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(wardrobes)

############################     chests     #######################
material = ["realleather", "glass", "solidwood", "wood"]
style = ["nature","industrial", "scandinavian", "modern"]
chests = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/kommoden-und-sideboards/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      chests <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'shelve',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(chests)

############################     desks     #######################
material = ["solidwood", "glass", "woodsemisolid" ]
style = ["nature", "industrial", "scandinavian", "modern"]
desks = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/bueromoebel/buerotische/schreibtische/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      desks <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'desk',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(desks)

############################     desk chairs     #######################
material = ["realleather", "textile", "plastic", "syntheticleather"]
style = ["nature", "industrial", "scandinavian", "modern"]
deskchairs = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/bueromoebel/buerostuehle-shop/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      deskchairs <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'desk chair',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(deskchairs)

############################     lamps     #######################
material = ["metal", "solidwood", "woodsemisolid"]
style = ["industrial", "nature"]
lamps = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/innenleuchten-shop/stehleuchten/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      lamps <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'lamp',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(lamps)


############################     bathroom lamps, only glass     #######################
material = ["glass"]
style = ["modern"]
bathroom_lamps = []
material.each do |m|
  style.each do |s|
    url = "https://www.home24.de/kategorie/innenleuchten-shop/badezimmerleuchten/?material=#{m}&styleFilter=#{s}Style"
    scraper(url).each do |product|
      bathroom_lamps <<  {
        name:                 product[:name],
        sku:                  rand(10 ** 10).to_s,
        stock:                5,
        photo:                product[:photo],
        style:                s,
        material:             m,
        category:             'lamp',
        price_cents:          product[:price_cents],
        description:          product[:description]
      }
    end
  end
end
Product.create!(bathroom_lamps)


####### delete dublicate products and products that do were not scraped correctly ########
p = Product.all
p.each do |product|
  product.delete unless Product.all.where(name: product[:name]).count == 1
  product.delete if product[:price_cents] == 'ab'
  product.delete if product[:price_cents] < (2500/(365*1.5))
  product.delete unless product[:name].to_s.match(/\d+/) == nil
  product.delete unless product[:name].to_s.match(/\W+/) == nil
end

######### creates 5 items for each product ##########
#########          DO NOT CHANGE           ##########
Product.all.each do |product|
  5.times do
    Item.create(product_id: product.id)
  end
end
#########          DO NOT CHANGE           ##########

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
    name:                 'bathroom'
  },
  {
    name:                 'other'
  }
]

Room.create!(rooms_attributes)

##########   links the product category to the room category   ##########

Product.all.where(category: 'bed').each do  |product|
  product.rooms << Room.find_by(name: 'bedroom')
end

Product.all.where(category: 'table').each do  |product|
  product.rooms << Room.find_by(name: 'living room')
  product.rooms << Room.find_by(name: 'kitchen')
end

Product.all.where(category: 'chair').each do  |product|
  product.rooms << Room.find_by(name: 'kitchen')
  product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'sofa').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'wardrobe').each do  |product|
   product.rooms << Room.find_by(name: 'bedroom')
end

Product.all.where(category: 'shelve').each do  |product|
  product.rooms << Room.find_by(name: 'bedroom')
  product.rooms << Room.find_by(name: 'kitchen')
  product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'desk').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'desk chair').each do  |product|
   product.rooms << Room.find_by(name: 'living room')
end

Product.all.where(category: 'lamp').each do  |product|
  product.rooms << Room.find_by(name: 'living room') unless product[:material] == 'glass'
  product.rooms << Room.find_by(name: 'bedroom') unless product[:material] == 'glass'
  product.rooms << Room.find_by(name: 'kitchen') unless product[:material] == 'glass'
  product.rooms << Room.find_by(name: 'bathroom') if product[:material] == 'glass'
end

##########     add to list if new product is added above      ##########

puts 'Finished!'
