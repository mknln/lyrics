class Playlist < ActiveRecord::Base
  attr_accessible :lyric_ids, :name
  serialize :lyric_ids, Array
  has_many :playlist_taggings
  has_many :lyrics, :through => :playlist_taggings

  before_save :filter_lyric_ids
  before_save :map_lyric_ids_to_lyrics

  def filter_lyric_ids
    self.lyric_ids.reject! { |id| id.blank? }
    self.lyric_ids.reject! { |id| !Lyric.exists?(id) }
  end

  def map_lyric_ids_to_lyrics
    self.lyrics = self.lyric_ids.collect { |id| Lyric.find(id) }
  end

end
