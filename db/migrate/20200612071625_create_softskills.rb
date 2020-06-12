class CreateSoftskills < ActiveRecord::Migration[6.0]
  def change
    create_table :softskills do |t|
      t.text :soft_skill
      t.references :interview_preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
