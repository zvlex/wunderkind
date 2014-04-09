class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status_ge
      t.string :status_en

      t.timestamps
    end
  end
end
