class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
	t.references 'product'
	t.references 'user'
	t.numeric 'value'


      t.timestamps
    end
  end
end
