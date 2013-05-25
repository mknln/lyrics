class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.text :lyric_ids

      t.timestamps
    end
  end
end
