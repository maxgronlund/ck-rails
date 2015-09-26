class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_hash_id , :null => true
      t.string :user_email
      t.string :password_digest
      t.string :user_avatar , :null => true
      t.text :user_address , :null => true
      t.string :user_phone , :null => true
      t.integer :user_country
      t.integer :user_state
      t.integer :user_city
      t.string :user_role	
      t.timestamps null: false
    end
  end
end
