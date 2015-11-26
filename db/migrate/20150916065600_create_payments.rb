class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string      :payment_hash_id , :null => true
      t.integer     :job_id
      t.string      :payment_status
      t.integer     :payment_price
      t.integer     :payment_days
      t.integer     :user_id
      t.boolean     :payment_approval
      t.datetime    :payment_approved_at
      t.datetime    :payment_paid_at
      t.string      :payment_method
      t.belongs_to  :jobblue, index: true
      t.timestamps null: false
    end
  end
end
