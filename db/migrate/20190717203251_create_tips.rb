class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|

      t.timestamps
    end
  end
end
