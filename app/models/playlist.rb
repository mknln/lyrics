class Playlist < ActiveRecord::Base
  attr_accessible :lyric_ids_list, :name, :lyric_ids, :lyrics
  serialize :lyric_ids_list, Array
  has_many :playlist_taggings, :dependent => :destroy
  has_many :lyrics, :through => :playlist_taggings, :order => 'playlist_taggings.id'

end
