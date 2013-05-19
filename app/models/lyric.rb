class Lyric < ActiveRecord::Base
  attr_accessible :artist, :content, :lyrics, :title

  def content_with_line_breaks
    content.gsub("\n", "<br />")
  end
end
