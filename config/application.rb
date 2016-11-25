require File.expand_path('../boot', __FILE__)

require 'rails/all'

if ENV['RACK_ENV'] == 'heroku'
  Bundler.require(:default, :test, :heroku)
else
  Bundler.require(*Rails.groups)
end

module DemocracyWatcher
  class Application < Rails::Application
    config.i18n.default_locale = Settings.default_language

    # Middleware to use I18NJS
    config.middleware.use I18n::JS::Middleware

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
