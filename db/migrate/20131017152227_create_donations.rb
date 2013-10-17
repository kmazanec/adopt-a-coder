class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :token
      t.integer :amount
      t.integer :donor_id
      t.integer :campaign_id
      t.timestamps
    end
  end
end
