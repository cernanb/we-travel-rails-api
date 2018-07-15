desc "Scrape locations"
task scrape_locations: :environment do 
  WeworkScraper.new.scrape_locations
end
