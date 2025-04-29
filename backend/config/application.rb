require_relative "boot"
require "rails/all"
require "dotenv"  # Explicitly require dotenv

Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    config.load_defaults 8.0
    config.api_only = true

    # Load .env file from one directory up
    config.before_configuration do
      dotenv_path = Rails.root.join("..", ".env")
      Dotenv.load(dotenv_path.to_s) if File.exist?(dotenv_path)
    end
  end
end
