class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :image
      t.string :type
      t.float :avg_rating
      t.text :description

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
