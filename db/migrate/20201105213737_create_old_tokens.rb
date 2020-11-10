class CreateOldTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :old_tokens do |t|
      t.string :title

      t.timestamps
    end
  end
end
