class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
