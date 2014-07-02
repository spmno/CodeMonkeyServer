json.array!(@infos) do |info|
  json.extract! info, :id, :title, :content
  json.url info_url(info, format: :json)
end
