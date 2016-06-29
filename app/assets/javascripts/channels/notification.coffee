App.notification = App.cable.subscriptions.create 'NotificationChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['notification']

  notify: (notification) ->
    @perform 'notify', notification: notification