class AddYoutubeIdToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :youtube_id, :string
  end
end
