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

  test "should find youtube ids" do
    ids = MusicScraper.youtube_id("black math horseman", "tyrant")
    assert ids.count > 0
  end

  test "should extract youtube id" do
    id = MusicScraper.extract_id('tag:youtube.com,2008:video:6YMcAzCpBik')
    assert_equal id, '6YMcAzCpBik'
  end
end
