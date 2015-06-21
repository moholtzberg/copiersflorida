require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

secret_file = "../../shared/app_secrets.yml"
SECRET = File.exists?(secret_file) ? YAML.load_file(secret_file) : {}

module Copiersflorida
  class Application < Rails::Application
    
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    config.assets.initialize_on_precompile = false
    
    config.paperclip_defaults = {
      :storage => :s3,
      s3_credentials: {
        access_key_id: SECRET['AWS_ACCESS_KEY_ID'],
        secret_access_key: SECRET['AWS_SECRET_ACCESS_KEY'],
        bucket: SECRET['S3_BUCKET_NAME'],
      },
    }
    config.active_record.raise_in_transactional_callbacks = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
