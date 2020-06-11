class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :statut
      t.references :interview_preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
