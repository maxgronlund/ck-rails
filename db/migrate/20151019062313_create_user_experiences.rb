class CreateUserExperiences < ActiveRecord::Migration
  def change
    create_table :user_experiences do |t|
      t.integer :user_id
      t.string :instance_name
      t.datetime :exp_start
      t.datetime :exp_end , :null => true
      t.timestamps null: false
    end
  end
end
