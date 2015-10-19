class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.text :userdetail_bio , :null => true
      t.text :userdetail_phone
      t.integer :userdetail_experience
      t.integer :userdetail_rating
      t.integer :userdetail_major
      t.string :curriculumvitae
      t.timestamps null: false
    end
  end
end
