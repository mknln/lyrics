class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :artist
      t.string :title
      t.string :lyrics
      t.text :content

      t.timestamps
    end
  end
end
