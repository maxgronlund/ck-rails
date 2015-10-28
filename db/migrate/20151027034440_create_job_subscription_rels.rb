class CreateJobSubscriptionRels < ActiveRecord::Migration
  def change
    create_table :job_subscription_rels do |t|
      t.integer :job_id
      t.integer :user_id
      t.string :month
      t.timestamps null: false
    end
  end
end
