/* DO NOT MODIFY. This file was compiled Sat, 14 May 2011 18:37:17 GMT from
 * /Users/matt/fantasy-congress/app/coffeescripts/site.coffee
 */

(function() {
  window.notify = function(message, delay) {
    return $.pnotify({
      pnotify_text: message,
      pnotify_delay: delay,
      pnotify_history: false
    });
  };
}).call(this);
