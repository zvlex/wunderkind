class CreatePrefixes < ActiveRecord::Migration
  def change
    create_table :prefixes do |t|
      t.string :prefix_ge
      t.string :prefix_en

      t.timestamps
    end
  end
end
