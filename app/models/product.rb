class Product < ActiveRecord::Base
  has_many :images
  belongs_to :prefix
  belongs_to :brand
  belongs_to :category
  belongs_to :sub_category
  belongs_to :sex
  attr_accessor :product_img
  accepts_nested_attributes_for :images, :allow_destroy => true

end
