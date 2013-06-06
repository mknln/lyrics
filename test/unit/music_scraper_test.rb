require 'test_helper'

class MusicScraperTest < ActiveSupport::TestCase

  test "should scrape tracks" do
    tracks = MusicScraper.scrape_tracks("black math horseman", "wyllt")
    assert tracks.count > 0

    tracks = MusicScraper.scrape_tracks("clutch", "transnational speedway league")
    assert tracks.count > 0
    
    tracks = MusicScraper.scrape_tracks("primus", "pork soda")
    assert tracks.count > 0

  end
end
