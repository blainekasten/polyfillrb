
module Polyfillrb
  module Rails
    module ViewHelper

      def polyfills
        content_tag('script', Polyfillrb.get_polyfills)
      end


    end
  end
end
