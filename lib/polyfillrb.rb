require 'polyfillrb/rails' if defined?(Rails)

module Polyfillrb

  PROJECT_DIRECTORY = File.expand_path(File.dirname(__FILE__))


  # Method to get the polyfills
  #
  # Params
  #   ua -> User Agent String
  #   minify -> Boolean if code should be minified or not
  #
  # returns String
  def self.get_polyfills(ua, minify=false)
    return %x( node #{PROJECT_DIRECTORY}/polyfill.js -p "#{ua}" #{minify})
  end


  # Detects if the service has been downloaded from git yet
  def self.has_installed_service?
    Dir.exist?(PROJECT_DIRECTORY+'/polyfill-service/')
  end

  # Detects if the service has installed it's dependencies
  def self.has_built_sources?
    Dir.exist?(PROJECT_DIRECTORY+'/polyfill-service/node_modules/')
  end

end

