class StaticPage < ActiveRecord::Base
  validates :title_ge, presence: true
  validates :title_en, presence: true
  validates :content_ge, presence: true


  rails_admin do
    label I18n.t('admin.static_page.menu_name')
    label_plural I18n.t('admin.static_page.menu_name')
    list do
      field :id
      field :title_ge do
        label I18n.t('admin.static_page.title_ge')
      end
      field :title_en do
        label I18n.t('admin.static_page.title_en')
      end
      field :status do
        label I18n.t('admin.static_page.status')
      end
    end

    show do
      field :id
      field :title_ge do
        label I18n.t('admin.static_page.title_ge')
      end
      field :title_en do
        label I18n.t('admin.static_page.title_en')
      end
      field :status do
        label I18n.t('admin.static_page.status')
      end
    end

    edit do
      field :title_ge do
        label I18n.t('admin.static_page.title_ge')
      end
      field :title_en do
        label I18n.t('admin.static_page.title_en')
      end
      field :content_ge, :ck_editor do
        label I18n.t('admin.static_page.content_ge')
      end
      field :content_en, :ck_editor do
        label I18n.t('admin.static_page.content_en')
      end
      field :status do
        label I18n.t('admin.static_page.status')
      end
    end
  end
end
