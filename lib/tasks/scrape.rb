require 'nokogiri'
require 'open-uri'


def scraper(url)

  outputs = []
  #url = 'https://www.home24.de/kategorie/wohnzimmermoebel/sofas-und-couches/?material=textile&styleFilter=modernStyle'
  html_file = open(url).read
  doc = Nokogiri::HTML(html_file)
  doc.search('.article-tile__wrap').each do |product|

    name = product.search('.article-tile__name').first.text.split[1]
    price_website = product.search('.article__price-wrap .article__price').first.text.split[0]
    # price_cents = 1000 if price_cents == 'ab'
    price_cents_string = price_website.gsub(/(,)/, "")
    price_cents = price_cents_string.to_i/(365*1.5)
    photo = product.search('.article-tile__image').first['data-echo']
    url2 = product.search('.article-tile__link').attribute('href').value
    url3 = "https://www.home24.de/#{url2}"

    html_file = open(url3).read
    doc = Nokogiri::HTML(html_file)
    doc.search('.article-long-desc').each do |description|
      description = description.search('.article-long-desc__text').text

        outputs << {
      :name => name,
      :price_cents => price_cents,
      :photo => photo,
      :description => description
    }
    end
  end
end

#scraper

