class SubCategory < ActiveRecord::Base
  has_one :category
  #belongs_to :category

  validates :title_ge, presence: true
  validates :title_en, presence: true
  validates :category_id, presence: true


end
