class QueueJob < ActiveRecord::Base
  attr_accessible :item

  def scrape_album
    puts "Scraping album... #{item}"
  end
  handle_asynchronously :scrape_album

end
