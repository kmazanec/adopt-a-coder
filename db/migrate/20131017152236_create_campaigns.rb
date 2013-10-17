class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :candidate_id
      t.date :start_date
      t.date :end_date
      t.integer :total
      t.integer :goal
      t.timestamps
    end
  end
end
