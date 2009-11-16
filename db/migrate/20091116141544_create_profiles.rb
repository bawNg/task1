class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.column :password, :varchar, :default => '', :null => false
      t.column :user_id, :integer, :default => -1, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
