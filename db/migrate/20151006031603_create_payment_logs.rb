class CreatePaymentLogs < ActiveRecord::Migration
  def change
    create_table :payment_logs do |t|
      t.belongs_to  :payment, index: true
      t.string      :payment_state
      t.integer     :issuer , :null => true
      t.datetime    :issued_at , :null => true
      t.timestamps null: false
    end
  end
end
