json.array!(@new_skill_gets) do |new_skill_get|
  json.extract! new_skill_get, :id, :title, :content
  json.url new_skill_get_url(new_skill_get, format: :json)
end
