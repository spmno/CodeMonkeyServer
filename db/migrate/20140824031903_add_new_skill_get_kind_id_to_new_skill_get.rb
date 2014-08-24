class AddNewSkillGetKindIdToNewSkillGet < ActiveRecord::Migration
  def change
    add_column :new_skill_gets, :new_skill_get_kind_id, :integer
  end
end
