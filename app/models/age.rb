class Age < ActiveRecord::Base
  has_one :product


  rails_admin do
    label I18n.t('admin.age.menu_name')
    label_plural I18n.t('admin.age.menu_name')
    list do
      field :id
      field :age_ge do
        label I18n.t('admin.age.age_ge')
      end
      field :age_en do
        label I18n.t('admin.age.age_en')
      end
    end

    show do
      field :id
      field :age_ge do
        label I18n.t('admin.age.age_ge')
      end
      field :age_en do
        label I18n.t('admin.age.age_en')
      end
    end

    edit do
      field :age_ge do
        label I18n.t('admin.age.age_ge')
      end
      field :age_en do
        label I18n.t('admin.age.age_en')
      end
    end
  end
end
