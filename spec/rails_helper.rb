# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'development'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

require 'factory_girl_rails'
require 'database_cleaner'



RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
