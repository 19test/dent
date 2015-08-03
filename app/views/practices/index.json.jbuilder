json.array!(@practices) do |practice|
  json.extract! practice, :id, :name, :address, :city, :province, :postal_code :phone_number, :bio
  json.url practice_url(practice, format: :json)
end
