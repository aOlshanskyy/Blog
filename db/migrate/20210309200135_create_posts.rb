class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
