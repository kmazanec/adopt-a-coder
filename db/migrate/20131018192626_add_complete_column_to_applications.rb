class AddCompleteColumnToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :complete, :boolean, default: false
  end
end
