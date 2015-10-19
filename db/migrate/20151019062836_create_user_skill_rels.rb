class CreateUserSkillRels < ActiveRecord::Migration
  def change
    create_table :user_skill_rels do |t|
      t.integer :user_id
      t.integer :skill_id
      t.timestamps null: false
    end
  end
end
