class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title, :hit_count, :youtube_id
  has_and_belongs_to_many :playlists

end
