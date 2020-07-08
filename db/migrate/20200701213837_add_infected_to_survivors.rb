class AddInfectedToSurvivors < ActiveRecord::Migration[6.0]
  def change
    add_column :survivors, :infected, :boolean
  end
end
