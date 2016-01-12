json.array!(@planes) do |plane|
  json.extract! plane, :id, :rows, :columns
  json.url plane_url(plane, format: :json)
end
