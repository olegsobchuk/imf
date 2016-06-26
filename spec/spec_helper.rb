require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'
require 'capybara/email/rspec'
require 'rspec/retry'
require 'simplecov'
require 'database_cleaner'

DEFAULT_PORT = 9887

Capybara.javascript_driver = :poltergeist
Capybara.asset_host = 'http://localhost:3000'
Capybara.server_port = DEFAULT_PORT
Capybara.app_host = "http://lvh.me:#{Capybara.server_port}"
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.autosave_on_failure = true

RSpec.configure do |config|
  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before :suite do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each, js: true do
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    begin
      DatabaseCleaner.clean
    rescue
      nil
    end
  end

  config.around :each, :js do |example|
    example.run_with_retry retry: 3
  end

  config.after(:all) do
    FileUtils.rm_rf("#{Rails.root}/public/test/uploads")
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
