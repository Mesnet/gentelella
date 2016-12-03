json.array!(@ranches) do |ranch|
  json.extract! ranch, :id, :name
  json.url ranch_url(ranch, format: :json)
end
