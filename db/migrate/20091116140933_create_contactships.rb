class CreateContactships < ActiveRecord::Migration
  def self.up
    create_table :contactships do |t|
      t.column :user_id, :integer, :default=>0, :null=>true
      t.column :contact_id, :integer, :default=>0, :null=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :contactships
  end
end
