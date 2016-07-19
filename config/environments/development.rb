Rails.application.configure do

  require 'dotenv'
  Dotenv.load

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true
  
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  # deviseの設定 
  config.action_mailer.default_url_options = { host: 'https://code-choochoopiston.c9users.io/' }  
  BetterErrors::Middleware.allow_ip! '10.240.0.213'
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {

    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'gmail.com',
    :authentication => 'plain',
    :user_name => ENV["GMAIL_ADDRESS"],
    :password => ENV["GMAIL_PASSWORD"],
  }

  require 'pusher'
  
  Pusher.app_id = ENV['PUSHER_APP_ID']
  Pusher.key = ENV["PUSHER_ACCESS_KEY"]
  Pusher.secret = ENV["PUSHER_ACCESS_KEY_SECRET"]
  Pusher.logger = Rails.logger
  Pusher.encrypted = true
  
end