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
        %x( cd #{Polyfillrb::PROJECT_DIRECTORY} && git clone --branch v1.3.0 git@github.com:Financial-Times/polyfill-service.git )

        # build the npm locals
        %x( cd #{Polyfillrb::PROJECT_DIRECTORY}/polyfill-service && [ -d "node_modules" ] || npm install && grunt buildsources )

      end

    end
  end
end
