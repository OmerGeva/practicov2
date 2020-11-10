class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :end_goal
      t.references :winner, index: true, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
