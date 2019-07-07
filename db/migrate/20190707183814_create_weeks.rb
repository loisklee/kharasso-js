class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.date :start_date
      t.integer :user_id
      t.boolean :completed
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
