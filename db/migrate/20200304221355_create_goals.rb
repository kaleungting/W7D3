class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :target, null: false
      t.string :privacy, null: false
      t.integer :user_id, null: false
    end

    add_index :goals, :user_id
  end
end
