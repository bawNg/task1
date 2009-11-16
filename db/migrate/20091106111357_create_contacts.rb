class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :first_name, :varchar, :default=>'', :null=>false
      t.column :last_name, :varchar, :default=>'', :null=>false
      t.column :email_address, :varchar, :default => '', :null=>false
      t.column :contact_number, :varchar, :default => '', :null => false   
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
