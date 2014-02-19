class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :not_referenced_any_line_items

  has_many :images
  belongs_to :prefix
  belongs_to :brand
  belongs_to :category
  belongs_to :sub_category
  belongs_to :sex
  attr_accessor :product_img
  accepts_nested_attributes_for :images, :allow_destroy => true

  private

    def not_referenced_any_line_items
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
