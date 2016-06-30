require 'active_record'
require 'bundler/setup'
Bundler.setup

require 'core_logic'

RSpec.configure do |config|

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => ':memory:',
  )
  require 'schema'

  config.run_all_when_everything_filtered = true

  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

end
