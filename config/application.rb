require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module HelloRailsBackEnd
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_paths << Rails.root.join('lib')

    config.api_only = true

    # Add the CORS configuration here
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3002'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end
    end
  end
end
