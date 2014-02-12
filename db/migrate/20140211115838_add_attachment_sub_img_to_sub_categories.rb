class AddAttachmentSubImgToSubCategories < ActiveRecord::Migration
  def self.up
    change_table :sub_categories do |t|
      t.attachment :sub_img
    end
  end

  def self.down
    drop_attached_file :sub_categories, :sub_img
  end
end
