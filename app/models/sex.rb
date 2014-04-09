class Sex < ActiveRecord::Base
  validates :sex_ge, presence: true
  validates :sex_en, presence: true

  rails_admin do
    label I18n.t('admin.brand.menu_name')
    label_plural I18n.t('admin.sex.menu_name')
    list do
      field :id
      field :sex_ge do
        label I18n.t('admin.sex.sex_ge')
      end
      field :sex_en do
        label I18n.t('admin.sex.sex_en')
      end
    end

    show do
      field :id
      field :sex_ge do
        label I18n.t('admin.sex.sex_ge')
      end
      field :sex_en do
        label I18n.t('admin.sex.sex_en')
      end
    end

    edit do
      field :sex_ge do
        label I18n.t('admin.sex.sex_ge')
      end
      field :sex_en do
        label I18n.t('admin.sex.sex_en')
      end
    end
  end

end
