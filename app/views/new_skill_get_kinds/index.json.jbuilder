json.array!(@new_skill_get_kinds) do |new_skill_get_kind|
  json.extract! new_skill_get_kind, :id
  json.url new_skill_get_kind_url(new_skill_get_kind, format: :json)
end
