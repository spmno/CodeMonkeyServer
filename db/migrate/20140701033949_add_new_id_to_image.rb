class AddNewIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :new_id, :integer
  end
end
