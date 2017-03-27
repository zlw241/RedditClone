class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.integer :user_id, null: false
      t.integer :sub_id, null: false
      t.text :content

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :sub_id
  end
end
