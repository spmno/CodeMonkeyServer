class AddTitleToNewSkillGetKind < ActiveRecord::Migration
  def change
    add_column :new_skill_get_kinds, :title, :string
  end
end
