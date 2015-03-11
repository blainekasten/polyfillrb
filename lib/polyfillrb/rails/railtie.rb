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
      initializer "polyfillrb.to_prepare" do |app|

        # clone polyfill
        Thread.new do
          ::Rails.logger.info "Gathering Polyfill Library..."
          %x( cd #{Polyfillrb::PROJECT_DIRECTORY} && git clone git@github.com:Financial-Times/polyfill-service.git )

          # build the npm locals
          ::Rails.logger.info "Buidling Polyfills...\n  this may take a minute"
          %x( cd #{Polyfillrb::PROJECT_DIRECTORY}/polyfill-service && [ -d "node_modules" ] || npm install && grunt buildsources )
        end

      end

    end
  end
end
