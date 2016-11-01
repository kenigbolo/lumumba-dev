require 'capybara/rspec'

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation) # leave it clean for FactoryGirl
    FactoryGirl.lint
    DatabaseCleaner.clean_with(:truncation) # clean what FactoryGirl created
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true

  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def any_image
  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'blank.png'))
end
