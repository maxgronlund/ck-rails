class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.text :userdetail_bio , :null => true
      t.text :userdetail_phone
      t.integer :experience_id
      t.integer :userdetail_rating
      t.integer :education_id
      t.string :curriculumvitae
      t.timestamps null: false
    end
  end
end
