class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :day
      t.string :num_of_males
      t.string :num_of_females
      t.boolean :atmosphere
      t.integer :expected_spend
      t.string :transaction_id
      t.references :table, foreign_key: true
      t.references :server, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
