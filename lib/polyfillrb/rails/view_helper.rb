
module Polyfillrb
  module Rails
    class ViewHelper

      def polyfills
        content_tag('script', Polyfillrb.get_polyfills)
      end


    end
  end
end
