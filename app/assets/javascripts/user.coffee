document.addEventListener "turbolinks:load", ->
  typingTimer = undefined
  doneTypingInterval = 2000
  $input = $('#user_location_input')

  doneTyping = ->
    $.get '/geo',
      address: $input.val()
      dataType: 'script'
    $("form :submit").prop('disabled', false)

  $input.on 'keyup', ->
    $("form :submit").prop('disabled', true)
    clearTimeout typingTimer
    typingTimer = setTimeout(doneTyping, doneTypingInterval)
