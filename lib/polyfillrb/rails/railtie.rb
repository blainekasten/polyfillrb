require 'rails'

module Polyfillrb
  module Rails
    class Railtie < ::Rails::Railtie

      # Include the react-rails view helper lazily
      initializer "polyfillrb.setup_view_helpers" do |app|
        ActiveSupport.on_load(:action_view) do
          include ::Polyfillrb::Rails::ViewHelper
        end
      end

      # Preload the application with polyfills
      initializer "polyfillrb.configure_rails_initialization" do |app|
        # clone polyfill
        puts "-- Cloning Polyfill js\n"
        #%x( cd #{PROJECT_DIRECTORY} && git clone --branch v1.2.0 git@github.com:Financial-Times/polyfill-service.git )
        %x( cd #{PROJECT_DIRECTORY} && git clone git@github.com:Financial-Times/polyfill-service.git )

        # build the npm locals
        puts "\n-- Grabbing dependencies\n"
        %x( cd #{PROJECT_DIRECTORY}/polyfill-service && npm install )

        # build the polyfills
        #puts "\n-- Building polyfills\n"
        #%x( cd #{PROJECT_DIRECTORY}/polyfill-service && grunt build )
      end

    end
  end
end
