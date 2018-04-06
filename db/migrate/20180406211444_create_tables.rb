class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.string :min_price
      t.boolean :available_today
      t.references :floor, foreign_key: true

      t.timestamps
    end
  end
end
