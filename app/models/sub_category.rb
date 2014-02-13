class SubCategory < ActiveRecord::Base
  attr_accessor :sub_img
  has_attached_file :sub_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :sub_img, :content_type => /\Aimage\/.*\Z/



  has_one :category
  belongs_to :category

  validates :title_ge, presence: true
  validates :title_en, presence: true
  validates :category_id, presence: true



end
