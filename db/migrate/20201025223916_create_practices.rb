class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :title
      t.integer :goal
      t.string :time_type
      t.float :total_duration, default: 0
      t.date :start_date
      t.integer :current_period_duration
      t.references :skill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
