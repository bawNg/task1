class CoveragePeriod < ActiveRecord::Base
  has_many :users

  def to_s
    self.period
  end
end
