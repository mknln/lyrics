class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title, :hit_count, :youtube_id

  def printable_title
    "#{artist} - #{title}"
  end

end
