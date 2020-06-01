class CreateInterviewPreparations < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_preparations do |t|
      t.string :company
      t.string :job
      t.date :interview_date
      t.string :job_description_link
      t.string :experience_expectation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
