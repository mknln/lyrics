class AddQueueJobIdToJobErrors < ActiveRecord::Migration
  def change
    add_column :job_errors, :queue_job_id, :integer
  end
end
