class CreateCandidateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_works do |t|
      t.string :question
      t.text :answer
      t.references :interview_preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
