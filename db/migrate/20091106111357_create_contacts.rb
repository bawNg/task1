class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :user_id, :integer, :default=>0, :null=>true
      t.column :contact_id, :integer, :default=>0, :null=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
