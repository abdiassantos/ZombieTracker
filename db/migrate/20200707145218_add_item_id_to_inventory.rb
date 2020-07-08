class AddItemIdToInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :item_id, :integer
  end
end
