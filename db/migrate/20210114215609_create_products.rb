class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.string :author
      t.text :description
      t.string :dimension
      t.integer :price, precision: 6, scale: 0
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
