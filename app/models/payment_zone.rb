class PaymentZone < ActiveRecord::Base

  rails_admin do
    label I18n.t('admin.payment_zone.menu_name')
    label_plural I18n.t('admin.payment_zone.menu_name')
    list do
      field :id
      field :zone_name_ge do
        label I18n.t('admin.payment_zone.zone_name_ge')
      end
      field :zone_name_en do
        label I18n.t('admin.payment_zone.zone_name_en')
      end
      field :country_id do
        label I18n.t('admin.payment_zone.country')
      end
      field :delivery_price do
        label I18n.t('admin.payment_zone.delivery_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end
    #
    show do
      field :id
      field :zone_name_ge do
        label I18n.t('admin.payment_zone.zone_name_ge')
      end
      field :zone_name_en do
        label I18n.t('admin.payment_zone.zone_name_en')
      end
      field :country_id do
        label I18n.t('admin.payment_zone.country')
      end
      field :delivery_price do
        label I18n.t('admin.payment_zone.delivery_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end

    edit do
      field :zone_name_ge do
        label I18n.t('admin.payment_zone.zone_name_ge')
      end
      field :zone_name_en do
        label I18n.t('admin.payment_zone.zone_name_en')
      end
      field :country_id do
        label I18n.t('admin.payment_zone.country')
      end
      field :delivery_price do
        label I18n.t('admin.payment_zone.delivery_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end
  end
end
