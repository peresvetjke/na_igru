require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaIgru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.autoload_paths += %W{#{config.root}/app/services/}
    # Rails.autoloaders.log!


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.time_zone = "Moscow"
    Time::DATE_FORMATS[:default] = "%H-%M (%d/%m/%Y)"
    # config.eager_load_paths << Rails.root.join("extras")

  end
end
