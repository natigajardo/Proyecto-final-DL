class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :total, default: 0 
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
