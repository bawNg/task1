class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :coverage_id
      t.integer :coverage_period_id
      t.string :profile_id
      t.datetime :date_of_birth
      t.text :address
      t.string :state
      t.string :city
      t.string :contact_number
      t.string :postal_code
      t.float :height
      t.float :weight
      t.boolean :is_smoker
      t.string :email_address
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
