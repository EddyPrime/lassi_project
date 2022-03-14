class ChangeIntegerLimitInPayementMethods < ActiveRecord::Migration[5.1]
  def change
	change_column :payement_methods, :number, :integer, limit: 16
  end
end
