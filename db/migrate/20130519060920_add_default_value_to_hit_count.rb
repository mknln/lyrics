class AddDefaultValueToHitCount < ActiveRecord::Migration
  def change
    change_table(:lyrics) do |t|
      t.change :hit_count, :integer, :null => false, :default => 0
    end
  end
end
