class Playlist < ActiveRecord::Base
  attr_accessible :lyric_ids, :name
  serialize :lyric_ids, Array

end
