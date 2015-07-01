json.array!(@practices) do |practice|
  json.extract! practice, :id, :name, :address, :phone_number
  json.url practice_url(practice, format: :json)
end
