class CreateNewSkillGets < ActiveRecord::Migration
  def change
    create_table :new_skill_gets do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
