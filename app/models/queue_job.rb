class QueueJob < ActiveRecord::Base
  attr_accessible :item

  def run
  end

end
