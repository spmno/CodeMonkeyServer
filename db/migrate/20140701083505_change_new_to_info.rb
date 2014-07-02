class ChangeNewToInfo < ActiveRecord::Migration
  def change
    rename_column :images, :new_id, :info_id
  end
end
