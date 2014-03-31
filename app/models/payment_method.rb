class PaymentMethod < ActiveRecord::Base
  def index
    @payment_methods = PaymentMethod.all
  end



  rails_admin do
    list do
      field :id
      field :method_name_ge
      field :method_name_en
    end

    show do
      field :method_name_ge
      field :method_name_en
    end

    edit do
      field :method_name_ge
      field :method_name_en
      field :description_ge, :ck_editor
      field :description_en, :ck_editor
    end
  end
end
