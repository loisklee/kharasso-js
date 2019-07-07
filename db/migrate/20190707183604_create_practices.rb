class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :category
      t.integer :creator_id
      t.text :description

      t.timestamps
    end
  end
end
