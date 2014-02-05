class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  accepts_nested_attributes_for :sub_categories, :allow_destroy => true
  validates :title_ge, presence: true
  validates :title_en, presence: true

  rails_admin do
    list do
      field :id
      field :title_ge
      field :title_en
      field :created_at
      field :updated_at
    end

    edit do
      field :title_ge
      field :title_en
    end
  end

  def category_fields
    "#{self.title_ge}"
  end

end
