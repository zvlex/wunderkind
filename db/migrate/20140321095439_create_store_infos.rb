class CreateStoreInfos < ActiveRecord::Migration
  def change
    create_table :store_infos do |t|
      t.string :store_name
      t.string :store_owner
      t.string :store_address
      t.string :store_email
      t.string :store_phone
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
