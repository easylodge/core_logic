module Corelogic
  class Credential < ActiveRecord::Base
    self.table_name = "corelogic_credentials"
    self.primary_key = :id
  end
end
