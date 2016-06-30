<%- if @notification.persisted? %>
  $('form#new_notification textarea').val('')
<%- else %>
  alert 'Notification was not create'
<% end %>