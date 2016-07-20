ActiveRecord::Schema.define do
  self.verbose = false

  create_table :corelogic_credentials, id: false do |t|
    t.integer :id
    t.text :access_token
    t.datetime :expiry_time
  end
end
