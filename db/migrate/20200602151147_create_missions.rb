class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.text :name
      t.references :interview_preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
