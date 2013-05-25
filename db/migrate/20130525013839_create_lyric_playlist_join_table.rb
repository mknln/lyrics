class CreateLyricPlaylistJoinTable < ActiveRecord::Migration
  def change
    create_table :lyrics_playlists, :id => false do |t|
      t.integer :lyric_id
      t.integer :playlist_id
    end
  end
end
