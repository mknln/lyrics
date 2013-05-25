class PlaylistTagging < ActiveRecord::Base
  belongs_to :lyric
  belongs_to :playlist
  # attr_accessible :title, :body
end
