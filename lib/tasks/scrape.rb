require 'nokogiri'
require 'open-uri'

def scraper

  outputs = []
  url = 'https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/sofas/'

  html_file = open(url).read
  doc = Nokogiri::HTML(html_file)
  doc.search('.article-tile__wrap').each do |product|

    name = product.search('.article-tile__name').first.text
    price_cents = product.search('.article__price-wrap .article__price').first.text
    photo = product.search('.article-tile__image').first['data-echo']

    outputs << {
      :name => name,
      :price_cents => price_cents,
      :photo => photo
    }
  end

  return outputs

end

p scraper
