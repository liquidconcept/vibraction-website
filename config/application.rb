require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsWebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'fr-CH'
    config.i18n.available_locales = 'fr-CH'

    # Load rep params
    config.eager_load_paths << Rails.root.join('app/params')
    config.assets.paths << Rails.root.join('app/assets/video', 'app/assets/images')
    config.assets.enabled = true

    # configure mailer smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.mandrillapp.com',
      port:                 587,                        # ports 587 and 2525 are also supported with STARTTLS
      enable_starttls_auto: true,                       # detects and uses STARTTLS
      authentication:       'login',                    # Mandrill supports 'plain' or 'login'
      user_name:            Rails.application.secrets.mandrill_username,
      password:             Rails.application.secrets.mandrill_password,
      domain:               'liquid-concept.ch'         # your domain to identify your server when connecting
    }
  end
end
