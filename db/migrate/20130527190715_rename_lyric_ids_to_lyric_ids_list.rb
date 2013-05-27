class RenameLyricIdsToLyricIdsList < ActiveRecord::Migration
  def up
    rename_column :playlists, :lyric_ids, :lyric_ids_list
  end

  def down
    rename_column :playlists, :lyric_ids_list, :lyric_ids
  end
end
