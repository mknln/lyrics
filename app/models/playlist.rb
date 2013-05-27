class Playlist < ActiveRecord::Base
  attr_accessible :lyric_ids_list, :name
  serialize :lyric_ids_list, Array
  has_many :playlist_taggings
  has_many :lyrics, :through => :playlist_taggings

  before_save :filter_lyric_ids_list
  before_save :map_lyric_ids_list_to_lyrics

  def filter_lyric_ids_list
    self.lyric_ids_list.reject! { |id| id.blank? }
    self.lyric_ids_list.reject! { |id| !Lyric.exists?(id) }
  end

  def map_lyric_ids_list_to_lyrics
    self.lyrics = self.lyric_ids_list.collect { |id| Lyric.find(id) }

    self.lyric_ids_list = [] # this is just a temporary field
  end

end
