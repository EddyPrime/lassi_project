class CreatePayementMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payement_methods do |t|
	t.references 'user'
	t.integer 'number'
      t.timestamps
    end
  end
end
