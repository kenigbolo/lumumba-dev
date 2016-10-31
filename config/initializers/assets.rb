# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('/app/assets/fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( main.css )
Rails.application.config.assets.precompile += %w( marcos.css )
Rails.application.config.assets.precompile += %w( drop-theme-arrows.css )
Rails.application.config.assets.precompile += %w( pagination.css )
Rails.application.config.assets.precompile += %w( select-theme-defaults.css )
Rails.application.config.assets.precompile += %w( tether.min.css )
Rails.application.config.assets.precompile += %w( tether.min.js )
Rails.application.config.assets.precompile += %w( select.min.js )
Rails.application.config.assets.precompile += %w( drop.min.js )
Rails.application.config.assets.precompile += %w( main.js )