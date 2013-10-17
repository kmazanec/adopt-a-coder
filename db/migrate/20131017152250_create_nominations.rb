class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :campaign_id
      t.integer :donor_id
      t.integer :candidate_id
      
      t.timestamps
    end
  end
end
