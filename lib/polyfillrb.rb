require 'polyfillrb/rails'

module Polyfillrb

  PROJECT_DIRECTORY = File.expand_path(File.dirname(__FILE__))

  def self.get_polyfills

    jscode = <<-JS
      console.log(
        require('#{PROJECT_DIRECTORY}/polyfill-service/lib/index.js').getPolyfillString({
          uaString: 'Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)'
        })
      );
    JS

    i = IO.popen('node', 'r+')
    i.write(jscode)
    i.close_write

    polyfills = i.read 
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts polyfills
    polyfills
  end


  #
  # loads the javascript for the application
  def self.init
    # check for node and npm


    # clone polyfill
    puts "-- Cloning Polyfill js\n"
    %x( cd #{PROJECT_DIRECTORY} && git clone --branch v1.2.0 git@github.com:Financial-Times/polyfill-service.git )

    # build the npm locals
    puts "\n-- Grabbing dependencies\n"
    %x( cd #{PROJECT_DIRECTORY}/polyfill-service && npm install )

    # build the polyfills
    #puts "\n-- Building polyfills\n"
    #%x( cd #{PROJECT_DIRECTORY}/polyfill-service && grunt build )
  end

end

