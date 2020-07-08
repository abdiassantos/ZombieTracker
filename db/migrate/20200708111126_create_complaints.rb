class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
