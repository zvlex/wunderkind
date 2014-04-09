class Banner < ActiveRecord::Base
  has_attached_file :img_url, :styles => { :medium => '760x243#', :thumb => '110x42#' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :img_url, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true

  rails_admin do

    label I18n.t('admin.banner.menu_name')
    label_plural I18n.t('admin.banner.menu_name')

    list do
      field :id
      field :title do
        label I18n.t('admin.banner.title')
      end
      field :status do
        label I18n.t('admin.banner.status')
      end
      field :img_url do
        label I18n.t('admin.banner.img')
      end
    end

    edit do
      field :title do
        label I18n.t('admin.banner.title')
      end
      field :status do
        label I18n.t('admin.banner.status')
      end
      field :img_url, :paperclip do
        label I18n.t('admin.banner.img')
      end
    end

  end
end
