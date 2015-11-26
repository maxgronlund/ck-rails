class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string    :category_name
      t.belongs_to  :jobblue, index: true
      t.timestamps null: false
    end
  end
end
