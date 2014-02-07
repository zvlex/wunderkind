class AddAttachmentProductImgToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :product_img
    end
  end

  def self.down
    drop_attached_file :images, :product_img
  end
end
