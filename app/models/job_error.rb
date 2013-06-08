
class JobError < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :queue_job

end
