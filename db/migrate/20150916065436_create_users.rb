class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :user_name
      t.string  :user_hash_id , :null => true
      t.string  :user_email
      t.string  :password_digest
      t.string  :avatar , :null => true
      t.text    :user_address , :null => true
      t.string  :user_phone , :null => true
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.string  :user_role
      t.string  :flag
      t.timestamps null: false
    end
  end
end
