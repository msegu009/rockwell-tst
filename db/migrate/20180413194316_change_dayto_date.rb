class ChangeDaytoDate < ActiveRecord::Migration[5.1]
  def change
  	change_column :bookings, :day, 'date USING day::date'
  end
end
