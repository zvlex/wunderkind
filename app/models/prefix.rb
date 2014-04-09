class Prefix < ActiveRecord::Base
  has_one :product
  validates :prefix_ge, presence: true
  validates :prefix_en, presence: true

  rails_admin do
    label I18n.t('admin.prefix.menu_name')
    label_plural I18n.t('admin.prefix.menu_name')
    list do
      field :id
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end

    show do
      field :id
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end

    edit do
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end
  end

end
