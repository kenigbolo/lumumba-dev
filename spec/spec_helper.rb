if (RSpec.configuration.instance_variable_get :@files_or_directories_to_run) == ['spec']
  unless ENV['CODESHIP']
    # simplecov must be required/started before loading any application code
    require 'simplecov'
    SimpleCov.start 'rails'
  end
end

require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    if ENV['CODESHIP'] # linting is very slow due to file uploads in factories, so it's restricted to Codeship for now.
      FactoryGirl.lint
      DatabaseCleaner.clean_with(:truncation) # clean what FactoryGirl created
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
