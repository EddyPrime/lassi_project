class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
	t.string 'productId'
	t.references 'user'
	t.numeric 'price'
	t.string 'type'

      t.timestamps
    end
  end
end
