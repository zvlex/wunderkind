class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.string :age_ge
      t.string :age_en

      t.timestamps
    end
  end
end
