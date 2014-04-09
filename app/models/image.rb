class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :product_img, :styles => { :index => '207x181#' ,:medium => '175x175#', :thumb => '100x100#', :list => '45x45#' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :product_img, :content_type => /\Aimage\/.*\Z/

end
