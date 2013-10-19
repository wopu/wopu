json.array!(@tags) do |tag|
  json.extract! tag, :name, :thing_type, :thing_id
  json.url tag_url(tag, format: :json)
end
