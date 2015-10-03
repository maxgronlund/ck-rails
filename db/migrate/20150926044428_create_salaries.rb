class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :salary_code
      t.string  :salary_string
      t.belongs_to  :job, index: true
      t.timestamps null: false
    end
  end
end
