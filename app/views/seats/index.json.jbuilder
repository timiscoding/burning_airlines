json.array!(@seats) do |seat|
  json.extract! seat, :id, :flight_id, :user_id, :status
  json.url seat_url(seat, format: :json)
end
