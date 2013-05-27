class CreatePlaylistTaggings < ActiveRecord::Migration
  def change
    create_table :playlist_taggings do |t|
      t.belongs_to :lyric
      t.belongs_to :playlist

      t.timestamps
    end
    add_index :playlist_taggings, :lyric_id
    add_index :playlist_taggings, :playlist_id
  end
end
