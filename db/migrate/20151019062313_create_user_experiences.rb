class CreateUserExperiences < ActiveRecord::Migration
  def change
    create_table :user_experiences do |t|
      t.integer :user_id
      t.string :instance
      t.string :position
      t.datetime :started
      t.datetime :ends
      t.timestamps null: false
    end
  end
end
