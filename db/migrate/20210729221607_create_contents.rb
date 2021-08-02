class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
