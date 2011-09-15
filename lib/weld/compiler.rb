

module Weld
  module Compiler
    def self.context
      ExecJS.compile <<-JAVASCRIPT
        var run = function(html, data) {
          var jsdom = require('jsdom');
          var weldlib = require('weld');

          var a;
          jsdom.env(html, function(error, window) {
            var element = window.document;
            weldlib.weld(element, data);
            a = element.innerHTML;
          });
          return a;
        };
      JAVASCRIPT
    end
  end
end
