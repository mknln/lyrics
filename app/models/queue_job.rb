class QueueJob < ActiveRecord::Base
  attr_accessible :item

  def scrape_album
    puts "Scraping album... #{item}"
  end
  handle_asynchronously :scrape_album

  def self.scrape_tracks(artist, title)
    release_group_search = MusicBrainz::ReleaseGroup.search(artist, title)
    if release_group_search.present? && release_group_search.count > 0
      release_group = MusicBrainz::ReleaseGroup.find(release_group_search[0][:id])
      release_group.releases[0].tracks.map(&:title)
    else
      ["No tracks found"]
    end
  end

end
