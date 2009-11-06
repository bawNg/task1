class CreateCoverages < ActiveRecord::Migration
  def self.up
    create_table :coverages do |t|
      t.integer :amount
      t.timestamps
    end
    create_table :coverage_periods do |t|
      t.integer :period
      t.timestamps
    end
  end

  def self.down
    drop_table :coverages
    drop_table :coverage_periods
  end
end
