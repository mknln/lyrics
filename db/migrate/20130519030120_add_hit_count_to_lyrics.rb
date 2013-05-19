class AddHitCountToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :hit_count, :integer
  end
end
