class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :application_id
      t.text :body
      t.timestamps
    end
  end
end
