json.array!(@new_skill_gets) do |new_skill_get|
  json.extract! new_skill_get, :id, :title, :content
end
