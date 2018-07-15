require 'open-uri'
require 'nokogiri'

class WeworkScraper 
  BASE_URL = "https://www.wework.com"

  def scrape_locations
    page = Nokogiri::HTML(open(BASE_URL + "/locations"))
    
    page.css('.country__countryList__2mgyq').each do |country|
      country_name = country.css('.title3').text
      
      country.css('.marketListItem__countryList__1PP4c').each do |city|
        city_url = city.css('a').attribute('href').value
        city_name = city.css('a').text.strip
        city_page = Nokogiri::HTML(open(BASE_URL + city_url))
        city_page.css('.kspqOD').each do |wework|
          ww_name = wework.css('.keoEwL').text
          Wework.create(name: ww_name, city: city_name, country: country_name)
        end
      end
    end
  end
end