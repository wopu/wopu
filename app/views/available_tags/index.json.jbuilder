json.array!(@available_tags) do |available_tag|
  json.extract! available_tag, :name
  json.url available_tag_url(available_tag, format: :json)
end
