require 'polyfillrb/rails'

module Polyfillrb

  def self.get_polyfills

    jscode = <<-JS
      console.log(
        var polyfills = require('./polyfill-service').getPolyfillString({
          uaString: 'Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)',
          features: {
            'Element.prototype.matches': { flags: ['always', 'gated'] },
            'modernizr:es5array': {}
          }
        });
      );
    JS

    jscode = <<-JS
      console.log('hello, is this working?')
    JS


    i = IO.popen('node', 'r+')
    i.write(jscode)
    i.close_write

    polyfills = i.read 
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts polyfills
  end

end

