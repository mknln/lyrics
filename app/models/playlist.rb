class Playlist < ActiveRecord::Base
  attr_accessible :lyric_ids, :name
  serialize :lyric_ids, Array

  before_save :filter_lyric_ids

  def filter_lyric_ids
    lyric_ids.reject! { |id| id.blank? }
    lyric_ids.reject! { |id| !Lyric.exists?(id) }
  end

end
