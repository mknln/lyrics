module ApplicationHelper
  def youtube_embed(id)
    "<iframe id='player_#{id}' width='420' height='315' src='http://www.youtube.com/embed/#{id}' frameborder='0' allowfullscreen></iframe>"
  end

  def youtube_thumb(id)
    "<img src='#{youtube_thumb_url(id)}' />"
  end

  def youtube_thumb_url(id)
    "http://img.youtube.com/vi/#{id}/default.jpg"
  end
end
