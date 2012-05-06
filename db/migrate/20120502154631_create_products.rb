class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end
