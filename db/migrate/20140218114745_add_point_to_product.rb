class AddPointToProduct < ActiveRecord::Migration
  def change
    add_column :products, :point, :integer
  end
end
