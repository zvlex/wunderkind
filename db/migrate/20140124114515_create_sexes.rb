class CreateSexes < ActiveRecord::Migration
  def change
    create_table :sexes do |t|
      t.string :sex_ge
      t.string :sex_en

      t.timestamps
    end
  end
end
