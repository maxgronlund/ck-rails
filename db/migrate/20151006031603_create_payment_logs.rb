class CreatePaymentLogs < ActiveRecord::Migration
  def change
    create_table :payment_logs do |t|
      t.belongs_to  :payment, index: true
      t.integer     :approved_by , :null => true
      t.datetime    :approved_at , :null => true
      t.datetime    :paid_at , :null => true
      t.timestamps null: false
    end
  end
end
