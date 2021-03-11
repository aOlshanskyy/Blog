class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :object_id
      t.string :object_type
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
