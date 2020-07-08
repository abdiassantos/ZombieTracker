class AddSurvivorIdToInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :survivor_id, :integer
  end
end
