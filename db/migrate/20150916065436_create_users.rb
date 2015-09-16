class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_hash_id
      t.string :user_email
      t.string :password_digest
      t.string :user_avatar , :null => true
      t.text :user_address
      t.string :user_phone
      t.integer :user_country
      t.integer :user_state
      t.integer :user_city	
      t.timestamps null: false
    end
  end
end
