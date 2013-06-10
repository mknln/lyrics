class QueueJob < ActiveRecord::Base
  attr_accessible :item
  validates :item, :presence => true
  has_many :job_errors

  def scrape_album
    #puts "Scraping album... #{item}"
    artist, album = self.item.split('-').map(&:strip)
    tracks = MusicScraper.scrape_tracks(artist, album)
    tracks.each do |track|
      youtube_id = MusicScraper.youtube_id(artist, track).first || '' 
      Lyric.create!({ :artist => artist, :title => track, :youtube_id => youtube_id })
    end
  end
  handle_asynchronously :scrape_album

  def error(job, exception)
    #puts "!! Error during job: exception #{exception}"
    self.job_errors << JobError.create({:title => "Error", :description => exception.to_s})
  end

end
