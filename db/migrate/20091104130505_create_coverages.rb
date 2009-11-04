class CreateCoverages < ActiveRecord::Migration
  def self.up
    create_table :coverages do |t|
      t.integer :coverage
      t.integer :coverage_years
      t.timestamps
    end
  end

  def self.down
    drop_table :coverages
  end
end
