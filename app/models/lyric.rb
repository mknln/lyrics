class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title, :hit_count

end
