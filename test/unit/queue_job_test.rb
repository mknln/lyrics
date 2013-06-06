require 'test_helper'

class QueueJobTest < ActiveSupport::TestCase

  test "should scrape tracks" do
    tracks = QueueJob.scrape_tracks("black math horseman", "wyllt")
    assert tracks.count > 0

    tracks = QueueJob.scrape_tracks("clutch", "transnational speedway league")
    assert tracks.count > 0
    
    tracks = QueueJob.scrape_tracks("primus", "pork soda")
    assert tracks.count > 0

  end
end
