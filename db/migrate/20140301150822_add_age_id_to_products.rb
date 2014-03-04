class AddAgeIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :age_id, :integer
  end
end
