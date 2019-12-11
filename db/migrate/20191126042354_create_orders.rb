class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :phone
      t.float :total_money
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
