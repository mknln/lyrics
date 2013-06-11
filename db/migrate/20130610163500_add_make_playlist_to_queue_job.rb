class AddMakePlaylistToQueueJob < ActiveRecord::Migration
  def change
    add_column :queue_jobs, :make_playlist, :boolean
  end
end
