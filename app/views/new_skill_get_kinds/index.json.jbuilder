json.array!(@new_skill_get_kinds) do |new_skill_get_kind|
  json.extract! new_skill_get_kind, :id
  json.title new_skill_get_kind.title
end
