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
      config.to_prepare do

        # clone polyfill
        Thread.new do 
          if !::Polyfillrb.has_installed_service?
            ::Rails.logger.info "Gathering Polyfill Library..."
            %x( cd #{::Polyfillrb::PROJECT_DIRECTORY} && git clone git@github.com:Financial-Times/polyfill-service.git )
          end

          if !::Polyfillrb.has_built_sources?
            # build the npm locals
            ::Rails.logger.info "Buidling Polyfills...\n  this may take a minute\n You're server may not respond until this is done"
            %x( cd #{::Polyfillrb::PROJECT_DIRECTORY}/polyfill-service && npm install )
            %x( cd #{::Polyfillrb::PROJECT_DIRECTORY}/polyfill-service && grunt buildsources )
            ::Rails.logger.info "  Done! Polyfills are built. You're server should be back in action"
          end
        end

      end

    end
  end
end
