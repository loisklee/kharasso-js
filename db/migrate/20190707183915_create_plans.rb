class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :week_id
      t.integer :practice_id
      t.timestamps
    end
  end
end
