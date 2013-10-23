class AddIndexesToApplication < ActiveRecord::Migration
  def change
    add_index :applications, :candidate_id
    add_index :campaigns, :candidate_id
    add_index :donations, :donor_id
    add_index :donations, :campaign_id
    add_index :media, :user_id
    add_index :nominations, :candidate_id
    add_index :nominations, :donor_id
    add_index :nominations, :campaign_id
    add_index :responses, :application_id
    add_index :responses, :question_id
    add_index :users, :email
    add_column :campaigns, :current_campaign, :boolean, default: false
    add_column :applications, :submitted_at, :date
  end
end
