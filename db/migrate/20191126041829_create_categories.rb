class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :parent_id
      t.string :image
      t.text :description

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
