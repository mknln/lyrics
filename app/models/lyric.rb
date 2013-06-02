class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title, :hit_count, :youtube_id, :printable_title
  has_many :playlist_taggings, :dependent => :destroy
  has_many :playlists, :through => :playlist_taggings

  before_save :set_printable_title

  def set_printable_title
    self.printable_title = "#{artist} - #{title}"
  end

end
