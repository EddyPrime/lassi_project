class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
	t.references 'user'
	t.references 'product'
	t.numeric 'price'

      t.timestamps
    end
  end
end
