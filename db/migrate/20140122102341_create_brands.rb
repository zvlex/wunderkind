class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title_ge
      t.string :title_en

      t.timestamps
    end
  end
end
