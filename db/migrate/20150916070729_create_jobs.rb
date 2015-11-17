class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string    :job_name
      t.string    :job_hash_id , :null => true
      t.text      :job_description
      t.integer   :salary_id
      t.integer   :category_id
      t.integer   :country_id , :null => true
      t.integer   :state_id
      t.integer   :city_id
      t.datetime  :job_start
      t.datetime  :job_valid
      t.boolean   :job_is_fake , :null => true
      t.string    :job_status , :null => true
      t.integer   :user_id
      t.string    :flag
      t.timestamps null: false
    end
  end
end
