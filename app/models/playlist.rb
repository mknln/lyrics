class Playlist < ActiveRecord::Base
  attr_accessible :name, :lyric_list
  has_many :playlist_taggings
  has_many :lyrics, :through => :playlist_taggings

  # does not work
  def lyric_list
    lyrics.map(&:id).join(", ")
  end

  def lyric_list=(lyrics_text)
    self.lyrics = lyrics_text.split(",").map do |id|
      Lyric.find(id.strip)
    end

    self[:lyric_list] = lyrics_text
  end
end
