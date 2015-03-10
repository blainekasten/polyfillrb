require 'polyfillrb/rails'

module Polyfillrb

  PROJECT_DIRECTORY = File.expand_path(File.dirname(__FILE__))

  def self.get_polyfills(ua, minify=false)
    return %x( node ./polyfill.js -p "#{ua}" #{minify})
  end

end

