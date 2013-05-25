class AddLyricListFieldToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :lyric_list, :text
  end
end
