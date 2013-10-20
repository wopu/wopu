json.array!(@results) do |result|
  json.extract! result, :description
  json.url result_url(result, format: :json)
end
