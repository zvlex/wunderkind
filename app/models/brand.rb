class Brand < ActiveRecord::Base
  has_one :product
  validates :title_ge, presence: true
  validates :title_en, presence: true

  rails_admin do
    label I18n.t('admin.brand.menu_name')
    label_plural I18n.t('admin.brand.menu_name')
    list do
      field :id
      field :title_ge do
        label I18n.t('admin.brand.title_ge')
      end
      field :title_en do
        label I18n.t('admin.brand.title_en')
      end
    end

    show do
      field :id
      field :title_ge do
        label I18n.t('admin.brand.title_ge')
      end
      field :title_en do
        label I18n.t('admin.brand.title_en')
      end
    end

    edit do
      field :title_ge do
        label I18n.t('admin.brand.title_ge')
      end
      field :title_en do
        label I18n.t('admin.brand.title_en')
      end
    end
  end
end
