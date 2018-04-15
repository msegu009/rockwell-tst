class ChangeMinPriceToIntergerInTable < ActiveRecord::Migration[5.1]
  def change
  	change_column :tables, :min_price, "integer USING min_price::integer"
  end
end
