class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article_hash_id , :null => true
      t.string :article_title
      t.string :article_img_link , :null => true
      t.text   :article_body
      t.string :banner
      t.integer :user_id
      t.timestamps null: false
    end
  end
end