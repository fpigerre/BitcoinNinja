# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.coffee, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( payments.css )
Rails.application.config.assets.precompile += %w( guides/index.css )
Rails.application.config.assets.precompile += %w( guides/show.css )

Rails.application.config.assets.precompile += %w( select-theme-default.css )

Rails.application.config.assets.precompile += %w( jquery.payment.js )
Rails.application.config.assets.precompile += %w( payments.js )
Rails.application.config.assets.precompile += %w( select.min.js )
Rails.application.config.assets.precompile += %w( tether.min.js )