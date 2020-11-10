class CreatePracticeChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :practice_challenges do |t|
      t.string :total_duration, default: 0
      t.references :practice, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
