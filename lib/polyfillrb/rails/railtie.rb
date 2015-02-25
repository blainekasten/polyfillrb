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
    end
  end
end
