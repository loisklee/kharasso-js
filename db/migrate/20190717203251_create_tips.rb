class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.integer :user_id
      t.integer :practice_id
      t.text :content
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end
