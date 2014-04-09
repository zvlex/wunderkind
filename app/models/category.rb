class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  accepts_nested_attributes_for :sub_categories, :allow_destroy => true
  validates :title_ge, presence: true
  validates :title_en, presence: true

  rails_admin do
    label I18n.t('admin.category.menu_name')
    label_plural I18n.t('admin.category.menu_name')
    list do
      field :id
      field :title_ge do
        label I18n.t('admin.category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.category.title_en')
      end
    end

    show do
      field :id
      field :title_ge do
        label I18n.t('admin.category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.category.title_en')
      end
    end

    edit do
      field :title_ge do
        label I18n.t('admin.category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.category.title_en')
      end
    end
  end

  def category_fields
    "#{self.title_ge}"
  end

end
