class CreateNewSkillGetKinds < ActiveRecord::Migration
  def change
    create_table :new_skill_get_kinds do |t|

      t.timestamps
    end
  end
end
