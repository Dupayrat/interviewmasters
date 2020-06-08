class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :interview_date
      t.integer :price_per_hour
      t.integer :duration
      t.references :interview_preparation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
