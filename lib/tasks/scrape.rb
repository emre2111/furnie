require 'nokogiri'
require 'open-uri'
require 'json'

def scraper(url)

  outputs = []
  #url = 'https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/?material=textile&styleFilter=scandinavian'
  html_file = open(url).read
  doc = Nokogiri::HTML(html_file)
  doc.search('.article-tile__wrap').each do |product|

    name = product.search('.article-tile__name').first.text.split[1]
    price_website = product.search('.article__price-wrap .article__price').first.text
    price = price_website.gsub(/(\s|ab|\.|,)/, '').to_i
    price_cents = price / (365*1.5).to_i
    photo = product.search('.article-tile__image').first['data-echo']
    url2 = product.search('.article-tile__link').attribute('href').value
    url3 = "https://www.home24.de/#{url2}"

    # html_file = open(url3).read
    # doc = Nokogiri::HTML(html_file)
    # doc.search('.article-long-desc').each do |description|
    #   description = description.search('.article-long-desc__text').text
    # end
    outputs << {
      :name => name,
      :price_cents => price_cents,
      :photo => photo,
      :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore repellendus suscipit ullam, autem quo dolorem eum assumenda. Et perspiciatis odio debitis ipsum, harum fugit, quaerat exercitationem porro provident, commodi sapiente?'
    }
  end
  outputs
end


def write_doc

  products = []
  ############################     Beds     #######################
  material = ["realleather", "textile", "solidwood", "syntheticleather"]
  style = ["nature", "industrial", "scandinavian", "modern"]
  beds = []
  material.each do |m|
    p m
    style.each do |s|
      p s
      url = "https://www.home24.de/kategorie/schlafzimmermoebel/betten-shop/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each  do |product|
        p product[:name]
        products <<  {
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

  # ############################     Tables     #######################
  material = ["solidwood", "glass", "woodsemisolid" ]
  style = ["nature", "industrial", "scandinavian", "modern"]
  tables = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/esszimmermoebel/esstische/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     Chairs     #######################
  material = ["realleather", "textile", "plastic", "syntheticleather"]
  style = ["nature", "industrial", "scandinavian", "modern"]
  chairs = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/esszimmermoebel/esszimmerstuehle/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     Sofas     #######################
  material = ["realleather", "textile", "syntheticleather"]
  style = ["industrial", "scandinavian", "modern"]
  sofas = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/sofas/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     wardrobe     #######################
  material = ["realleather", "glass", "solidwood", "wood"]
  style = ["nature","industrial", "scandinavian", "modern"]
  wardrobes = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/schlafzimmermoebel/kleiderschraenke/?styleFilter=#{s}Style&material=#{m}"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     chests     #######################
  material = ["realleather", "glass", "solidwood", "wood"]
  style = ["nature","industrial", "scandinavian", "modern"]
  chests = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/kommoden-und-sideboards/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     desks     #######################
  material = ["solidwood", "glass", "woodsemisolid" ]
  style = ["nature", "industrial", "scandinavian", "modern"]
  desks = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/bueromoebel/buerotische/schreibtische/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     desk chairs     #######################
  material = ["realleather", "textile", "plastic", "syntheticleather"]
  style = ["nature", "industrial", "scandinavian", "modern"]
  deskchairs = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/bueromoebel/buerostuehle-shop/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  # ############################     lamps     #######################
  material = ["metal", "solidwood", "woodsemisolid"]
  style = ["industrial", "nature"]
  lamps = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/innenleuchten-shop/stehleuchten/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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


  # ############################     bathroom lamps, only glass     #######################
  material = ["glass"]
  style = ["modern"]
  bathroom_lamps = []
  material.each do |m|
    style.each do |s|
      url = "https://www.home24.de/kategorie/innenleuchten-shop/badezimmerleuchten/?material=#{m}&styleFilter=#{s}Style"
      scraper(url).each do |product|
        p product[:name]
        products <<  {
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

  File.open("db/attributes.json", "wb") do |f|
    f.write(JSON.pretty_generate(products))

  end


#   require 'json'
#   categories = {
#     'sofas-und-couches' => {
#       material: ["realleather", "textile"],
#       style: ["nature", "industrial"]
#     }
#   }
#   # {
#   #   material: ["solidwood", "glass", "woodsemisolid" ],
#   #   style: ["nature", "industrial", "scandinavian", "modern"]
#   # },
#   # {
#   #   material: ["realleather", "textile", "plastic", "syntheticleather"],
#   #   style: ["nature", "industrial", "scandinavian", "modern"]
#   # },
#   # {
#   #   material: ["realleather", "textile", "syntheticleather"],
#   #   style: ["industrial", "scandinavian", "modern"]
#   # }
# ]

#   products_attributes = []

#   categories.each_with_index do |key, value|
#     puts "categ #{index}"
#     value[:material].each do |m|
#       puts m
#       value[:style].each do |s|
#         puts s
#         url = "https://www.home24.de/kategorie/wohnzimmermoebel/#{key}/sofas/?material=#{m}&styleFilter=#{s}Style"
#         scraper(url).first(3).each do |product|
#           p product[:name]
# p product[:name]#
# products_attributes <<  {
#             name:                 product[:name],
#             sku:                  rand(10 ** 10).to_s,
#             stock:                5,
#             photo:                product[:photo],
#             style:                s,
#             material:             m,
#             category:             'sofa',
#             price_cents:          product[:price_cents],
#             description:          product[:description]
#           }
#       end
#     end
#   end
#   File.open("db/attributes.json","wb") do |f|
#     f.write(products_attributes.to_json)
#   end
# end  #
#   # write to json doc
end



write_doc














