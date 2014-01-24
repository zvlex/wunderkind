class Brand < ActiveRecord::Base
  has_one :product
  validates :title_ge, presence: true
  validates :title_en, presence: true
end
