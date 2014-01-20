class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title_ge
      t.string :title_en

      t.timestamps
    end
  end
end
