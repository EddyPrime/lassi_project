class ChangeProductTypeName < ActiveRecord::Migration[5.1]
  def change
  rename_column :products, :type, :product_type
  end
end
