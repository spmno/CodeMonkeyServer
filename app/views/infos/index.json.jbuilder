json.array!(@infos) do |info|
  json.id info.id
  json.title info.title
  json.content info.content
  json.images info.images do |image|
    json.id image.id
    json.photo image.photo.url
  end
  json.updated_at info.updated_at
end
