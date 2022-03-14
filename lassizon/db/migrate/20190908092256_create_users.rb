class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
	t.string 'name'
	t.string 'surname'
	t.date 'data'
	t.string 'position'

      t.timestamps
    end
  end
end
