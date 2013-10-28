class AddDetailsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :approved, :boolean, default: false
    add_index :candidates, :approved
    add_column :candidates, :active, :boolean, default: false
    add_index :candidates, :active
  end
end
