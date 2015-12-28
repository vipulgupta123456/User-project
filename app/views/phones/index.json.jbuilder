json.array!(@phones) do |phone|
  json.extract! phone, :id, :phone
  json.url phone_url(phone, format: :json)
end
