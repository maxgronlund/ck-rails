class CreateUserEducations < ActiveRecord::Migration
  def change
    create_table :user_educations do |t|
      t.integer :user_id
      t.string :education
      t.integer :year
      t.text :details , :null => true
      t.timestamps null: false
    end
  end
end
