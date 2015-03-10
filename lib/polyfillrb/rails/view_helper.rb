
module Polyfillrb
  module Rails
    module ViewHelper

      def polyfills
        polyfills = ::Polyfillrb.get_polyfills(
          request.env['HTTP_USER_AGENT'],
          (::Rails.env != 'development')
        )

        content_tag('script', polyfills, {}, false)
      end

    end
  end
end
