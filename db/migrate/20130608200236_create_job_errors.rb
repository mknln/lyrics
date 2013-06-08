class CreateJobErrors < ActiveRecord::Migration
  def change
    create_table :job_errors do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
