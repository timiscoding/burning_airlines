json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :seat_id, :user_id, :flight_id
  json.url reservation_url(reservation, format: :json)
  json.name reservation.user.name
end
