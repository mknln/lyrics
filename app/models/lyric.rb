class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title, :hit_count, :youtube_id
  has_many :playlist_taggings
  has_many :playlists, :through => :playlist_taggings

  def printable_title
    "#{artist} - #{title}"
  end

end
