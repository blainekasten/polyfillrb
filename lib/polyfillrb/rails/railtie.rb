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
        %x( cd #{Polyfillrb::PROJECT_DIRECTORY} && git clone git@github.com:Financial-Times/polyfill-service.git && cd ./polyfill-service && git checkout 4620fb6c3cdd0ff0d841034584b2bf6039367d12 )

        # build the npm locals
        %x( cd #{Polyfillrb::PROJECT_DIRECTORY}/polyfill-service && [ -d "node_modules" ] || npm install && grunt buildsources )

      end

    end
  end
end
