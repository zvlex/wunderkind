class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :product_img, :styles => { :medium => "175x175>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_img, :content_type => /\Aimage\/.*\Z/

end
