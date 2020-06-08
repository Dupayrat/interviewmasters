class CreateHardskills < ActiveRecord::Migration[6.0]
  def change
    create_table :hardskills do |t|
      t.text :hard_skill
      t.references :interview_preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
