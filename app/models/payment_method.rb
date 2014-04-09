class PaymentMethod < ActiveRecord::Base
  def index
    @payment_methods = PaymentMethod.all
  end



  rails_admin do
    label I18n.t('admin.payment_method.menu_name')
    label_plural I18n.t('admin.payment_method.menu_name')
    list do
      field :id
      field :method_name_ge do
        label I18n.t('admin.payment_method.method_name_ge')
      end
      field :method_name_en do
        label I18n.t('admin.payment_method.method_name_en')
      end
    end

    show do
      field :method_name_ge do
        label I18n.t('admin.payment_method.method_name_ge')
      end
      field :method_name_en do
        label I18n.t('admin.payment_method.method_name_ge')
      end
      field :img_link do
        label I18n.t('admin.payment_method.image_link')
      end
    end

    edit do
      field :method_name_ge do
        label I18n.t('admin.payment_method.method_name_ge')
      end
      field :method_name_en do
        label I18n.t('admin.payment_method.method_name_en')
      end
      field :description_ge, :ck_editor do
        label I18n.t('admin.payment_method.description_ge')
      end
      field :description_en, :ck_editor do
        label I18n.t('admin.payment_method.description_en')
      end
      field :img_link do
        label I18n.t('admin.payment_method.image_link')
      end
    end
  end
end
