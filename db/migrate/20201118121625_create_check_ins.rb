class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.string :duration
      t.string :learnings
      t.references :practice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
