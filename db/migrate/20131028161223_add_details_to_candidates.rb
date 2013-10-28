class AddDetailsToCandidates < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, default: false
    add_index :users, :approved
    add_column :users, :active, :boolean, default: false
    add_index :users, :active
  end
end
