class Sex < ActiveRecord::Base
  #has_one :product
  validates :sex_ge, presence: true
  validates :sex_en, presence: true

end
