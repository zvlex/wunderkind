class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :prefix_id
      t.string :title_ge
      t.string :title_en
      t.text :description_ge
      t.text :description_en
      t.string :model
      t.decimal :price, precision: 8, scale: 2
      t.integer :brand_id
      t.integer :category_id
      t.integer :sub_category_id
      t.boolean :in_stock
      t.integer :sex_id
      t.integer :quantity
      t.decimal :discount, precision: 8, scale: 2, default: false

      t.timestamps
    end
  end
end
