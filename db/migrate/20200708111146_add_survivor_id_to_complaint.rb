class AddSurvivorIdToComplaint < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :survivor_id, :integer
  end
end
