App.notification = App.cable.subscriptions.create 'NotificationChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    change_count()

  notify: (notification) ->
    @perform 'notify', notification: notification

  change_count = ->
    block = $('#notification_number')
    count = parseInt(block.html()) + 1
    block.html(count).addClass('pale-red')
