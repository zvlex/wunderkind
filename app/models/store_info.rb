class StoreInfo < ActiveRecord::Base


  rails_admin do
    label I18n.t('admin.store_name.menu_name')
    label_plural I18n.t('admin.store_name.menu_name')


    list do
      field :id
      field :store_name do
        label I18n.t('admin.store_name.store_name')
      end
      field :store_owner do
        label I18n.t('admin.store_name.store_owner')
      end
      field :store_address do
        label I18n.t('admin.store_name.store_address')
      end
      field :store_email do
        label I18n.t('admin.store_name.store_email')
      end
      field :store_phone do
        label I18n.t('admin.store_name.store_phone')
      end
    end

    show do
      field :id
      field :store_name do
        label I18n.t('admin.store_name.store_name')
      end
      field :store_owner do
        label I18n.t('admin.store_name.store_owner')
      end
      field :store_address do
        label I18n.t('admin.store_name.store_address')
      end
      field :store_email do
        label I18n.t('admin.store_name.store_email')
      end
      field :store_phone do
        label I18n.t('admin.store_name.store_phone')
      end
      field :meta_title do
        label I18n.t('admin.store_name.meta_info')
      end
      field :meta_keywords do
        label I18n.t('admin.store_name.meta_keyword')
      end
    end

    edit do
      field :store_name do
        label I18n.t('admin.store_name.store_name')
      end
      field :store_owner do
        label I18n.t('admin.store_name.store_owner')
      end
      field :store_address do
        label I18n.t('admin.store_name.store_address')
      end
      field :store_email do
        label I18n.t('admin.store_name.store_email')
      end
      field :store_phone do
        label I18n.t('admin.store_name.store_phone')
      end
      field :meta_title do
        label I18n.t('admin.store_name.meta_info')
      end
      field :meta_keywords do
        label I18n.t('admin.store_name.meta_keyword')
      end
    end
  end
end
