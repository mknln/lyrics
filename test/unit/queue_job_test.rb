require 'test_helper'

class QueueJobTest < ActiveSupport::TestCase
  test "should not save with empty item" do
    queue_job = QueueJob.create({item: ""})
    assert ! queue_job.valid?
  end

end
