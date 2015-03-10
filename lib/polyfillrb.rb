require 'polyfillrb/rails' if defined?(Rails)

module Polyfillrb

  PROJECT_DIRECTORY = File.expand_path(File.dirname(__FILE__))

  def self.get_polyfills(ua, minify=false)
    return %x( node #{PROJECT_DIRECTORY}/polyfill.js -p "#{ua}" #{minify})
  end

end

