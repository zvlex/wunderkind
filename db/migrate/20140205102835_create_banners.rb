class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :url
      t.boolean :status

      t.timestamps
    end
  end
end
