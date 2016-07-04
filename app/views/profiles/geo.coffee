$('#locations').empty()
$('#locations').html("<%= j render partial: 'location', collection: @locations, as: :location %>")

$(".location").on 'click', ->
  right_location = $(this).html()
  $('#user_location_input').val(right_location)

  lat = $(this).data('cordinatesLat')
  lng = $(this).data('cordinatesLng')
  build_map(lat, lng)
