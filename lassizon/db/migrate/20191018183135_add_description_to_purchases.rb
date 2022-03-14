class AddDescriptionToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :description, :string
  end
end
