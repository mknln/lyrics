class CreateQueueJobs < ActiveRecord::Migration
  def change
    create_table :queue_jobs do |t|
      t.string :item

      t.timestamps
    end
  end
end
