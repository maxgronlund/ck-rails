class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_hash_id
      t.integer :payment_job
      t.string :payment_status
      t.integer :payment_price
      t.integer :payment_days
      t.integer :payment_creator
      t.boolean :payment_approval
      t.datetime :payment_approved_at
      t.string :payment_method	
      t.timestamps null: false
    end
  end
end
