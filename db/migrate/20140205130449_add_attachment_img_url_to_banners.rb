class AddAttachmentImgUrlToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :img_url
    end
  end

  def self.down
    drop_attached_file :banners, :img_url
  end
end
