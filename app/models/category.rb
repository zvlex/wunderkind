class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  accepts_nested_attributes_for :sub_categories, :allow_destroy => true
  validates :title_ge, presence: true
  validates :title_en, presence: true


  def full_name(category_id)
    category = Category.find(category_id)
    category.title_ge
  end

  def category_fields
    "#{self.title_ge}"
  end

end
