class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title_ge
      t.string :title_en
      t.text :content_ge
      t.text :content_en
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
