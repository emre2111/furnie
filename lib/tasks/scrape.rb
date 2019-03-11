require 'nokogiri'
require 'open-uri'

def scraper(url)

  outputs = []
  html_file = open(url).read
  doc = Nokogiri::HTML(html_file)
  doc.search('.article-tile__wrap').each do |product|

    name = product.search('.article-tile__name').first.text.split[1]
    price_website = product.search('.article__price-wrap .article__price').first.text.split[0]
    # price_cents = 1000 if price_cents == 'ab'
    price_cents_string = price_website.gsub(/(,)/, "")
    price_cents = price_cents_string.to_i/(365*1.5)
    photo = product.search('.article-tile__image').first['data-echo']

    outputs << {
      :name => name,
      :price_cents => price_cents,
      :photo => photo
    }
  end
  outputs
end
