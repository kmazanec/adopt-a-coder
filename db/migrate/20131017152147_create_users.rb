class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :phone
      t.string :password_digest


      # ADDRESS
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip


      # SOCIAL MEDIA
      t.string :twitter
      t.string :facebook
      t.string :linked_in
      t.string :codeacademy
      t.string :github
      t.string :blog
      t.string :personal_url


      # STUDENT SPECIFIC FIELDS
      t.text :currently_working_on
      t.text :biography
      t.text :mission
      t.integer :profile_photo_id
      t.ingeger :profile_video_id


      # USER TYPE - For single-table inheritance
      t.string :type 



      t.timestamps
    end
  end
end
