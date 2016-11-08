require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module LumumbaProd
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join("app/lib")]
  end
end
