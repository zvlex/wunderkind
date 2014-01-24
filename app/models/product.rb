class Product < ActiveRecord::Base
  belongs_to :prefix
  belongs_to :brand
  belongs_to :category
  belongs_to :sex

end
