require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rspec'
require 'capybara/rails'
require 'simplecov'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

SimpleCov.start 'rails' do
  simplecov_formatters = [ SimpleCov::Formatter::HTMLFormatter ]
  SimpleCov.formatters = simplecov_formatters
end

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  
  config.include(Capybara::DSL, :type => :feature)
  Capybara.javascript_driver = :webkit

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.infer_spec_type_from_file_location!

end

