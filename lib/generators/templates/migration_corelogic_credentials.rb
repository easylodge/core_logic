class CreateCorelogicCredentials < ActiveRecord::Migration
  def self.up
    create_table :corelogic_credentials, id: false  do |t|
      t.integer :id
      t.text :access_token
      t.datetime :expiry_time
    end
  end
  
  def self.down
    drop_table :corelogic_credentials
  end
end