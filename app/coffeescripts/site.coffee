window.notify = (message, delay) ->
  $.pnotify
    pnotify_text: message
    pnotify_delay: delay
    pnotify_history: false
