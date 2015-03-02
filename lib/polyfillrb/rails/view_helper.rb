
module Polyfillrb
  module Rails
    module ViewHelper

      def polyfills
        polyfills = Polyfillrb.getPolyfills(
          request.env['HTTP_USER_AGENT'],
          (::Rails.env != 'development')
        )

        content_tag('script', polyfills)
      end

    end
  end
end
