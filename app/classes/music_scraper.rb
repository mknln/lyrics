
class MusicScraper

  def self.scrape_tracks(artist, title)
    release_group_search = MusicBrainz::ReleaseGroup.search(artist, title)
    if release_group_search.present? && release_group_search.count > 0
      release_group = MusicBrainz::ReleaseGroup.find(release_group_search[0][:id])
      release_group.releases[0].tracks.map(&:title)
    else
      ["No tracks found"]
    end
  end

  def self.youtube_id(artist, track)
    client = YouTubeIt::Client.new(:dev_key => APP_CONFIG['keys']['youtube'])
    result = client.videos_by(:query => "#{artist} - #{track} -vevo")
    ids = result.videos.map { |v| MusicScraper.extract_id(v.video_id) }
    ids
  end

  def self.extract_id(video_id_string)
    video_id_string.split(':').last
  end
end
