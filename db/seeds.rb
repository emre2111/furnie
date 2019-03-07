# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './lib/tasks/scrape.rb'


puts 'Cleaning database...'

Product.destroy_all
puts 'Creating products...'

Item.destroy_all
puts 'Creating items...'

############################     Table     #######################
tables = []
url = 'https://www.home24.de/kategorie/esszimmermoebel/esstische/?material=wood&styleFilter=modernStyle'
scraper(url).each do |product|
  tables <<  {
  name:                 product[:name],
  sku:                  '17927638490',
  stock:                10,
  photo:                product[:photo],
  style:                'modern',
  material:             'wood',
  product_category:     'table',
  price_cents:          product[:price_cents]
  }
end
Product.create!(tables)

############################     Chairs     #######################
chairs = []
url = 'https://www.home24.de/kategorie/esszimmermoebel/esszimmerstuehle/?material=textile&styleFilter=modernStyle'
scraper(url).each do |product|
  chairs <<  {
  name:                 product[:name],
  sku:                  '17927638490',
  stock:                10,
  photo:                product[:photo],
  style:                'modern',
  material:             'textile',
  product_category:     'chair',
  price_cents:          product[:price_cents]
  }
end
Product.create!(chairs)

############################     Sofa     #######################
sofas = []
url = 'https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/sofas/?material=textile&styleFilter=modernStyle'
scraper(url).each do |product|
  sofas <<  {
  name:                 product[:name],
  sku:                  '1948292030',
  stock:                10,
  photo:                product[:photo],
  style:                'modern',
  material:             'textile',
  product_category:     'sofa',
  price_cents:          product[:price_cents]
  }
end
Product.create!(sofas)

############################     Beds     #######################
beds = []
url = 'https://www.home24.de/kategorie/schlafzimmermoebel/betten-shop/bettgestelle/?material=textile&styleFilter=modernStyle'
scraper(url).each do |product|
  beds <<  {
  name:                 product[:name],
  sku:                  '17927638490',
  stock:                10,
  photo:                product[:photo],
  style:                'modern',
  material:             'textile',
  product_category:     'bed',
  price_cents:          product[:price_cents]
  }
end
Product.create!(beds)




puts 'Finished!'
