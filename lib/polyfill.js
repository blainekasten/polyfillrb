'use strict';

var args = process.argv.slice(3);

process.stdout.write((function(uaString, minify){
  return require(__dirname + '/polyfill-service/lib').getPolyfillString({
    uaString: uaString,
    minify: !!minify,
    features: { default: { flags: [] } }
  });
})(args[0], args[1]));
