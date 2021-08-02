class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.references :content
      t.string :uuid, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
