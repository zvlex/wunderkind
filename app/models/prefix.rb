class Prefix < ActiveRecord::Base
  has_one :product
  validates :prefix_ge, presence: true
  validates :prefix_en, presence: true

end
