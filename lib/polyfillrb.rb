require 'polyfillrb/rails'

module Polyfillrb

  PROJECT_DIRECTORY = File.expand_path(File.dirname(__FILE__))

  def self.get_polyfills(ua, minify=false)

    # we console.log the results of the polyfillService so that we
    # can read them from the IO instance.
    #
    # This feels kind of hacky, so in the future we can look into
    # better ways to inject JS into this.
    jscode = <<-JS
      console.log(
        require('#{PROJECT_DIRECTORY}/polyfill-service/lib').getPolyfillString({
          uaString: '#{ua}',
          minify: #{minify},
          features: { default: { flags: [] } }
        })
      );
    JS

    # pump into a node runner
    i = IO.popen('node', 'r+')
    i.write(jscode)
    i.close_write

    # return the results
    return i.read 
  end

end

