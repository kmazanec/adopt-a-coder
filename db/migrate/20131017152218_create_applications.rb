class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :candidate_id
      t.timestamps
    end
  end
end
