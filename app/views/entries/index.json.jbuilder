json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :summary, :url
  json.url entry_url(entry, format: :json)
end
