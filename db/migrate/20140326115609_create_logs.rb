class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :customer_id
      t.string :description
      t.string :h_code
      t.string :transaction_code
      t.string :g_xml

      t.timestamps
    end
  end
end
