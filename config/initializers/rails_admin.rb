# RailsAdmin config file. Generated on January 15, 2014 14:19
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.model Image do
      visible false
  end

  config.model Status do
    visible false
  end

  config.model SubCategory do
    config.label_methods << :title_ge
    label I18n.t('admin.sub_category.menu_name')
    label_plural I18n.t('admin.sub_category.menu_name')

    list do
      field :id
      field :title_ge do
        label I18n.t('admin.sub_category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.sub_category.title_en')
      end
      field :category do
        label I18n.t('admin.sub_category.category')
      end
    end

    show do
      field :id
      field :title_ge do
        label I18n.t('admin.sub_category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.sub_category.title_en')
      end
      field :category do
        label I18n.t('admin.sub_category.category')
      end
    end

    edit do
      field :title_ge do
        label I18n.t('admin.sub_category.title_ge')
      end
      field :title_en do
        label I18n.t('admin.sub_category.title_en')
      end
      field :category do
        label I18n.t('admin.sub_category.category')
      end
    end
  end

  config.model Product do
      label I18n.t('admin.products.menu_name')
      label_plural I18n.t('admin.products.menu_name')
      config.label_methods << :prefix_ge
      config.label_methods << :title_ge
      config.label_methods << :category
      config.label_methods << :sex_ge
      config.label_methods << :age_ge
      config.label_methods << :product_img_file_name



      list do
        field :id
        field :product_img do
          formatted_value do
            bindings[:view].tag(:img, { :src => bindings[:object].images.first.product_img(:list) }) << value
          end
          label I18n.t('admin.products.images')
        end
        field :prefix do
          label I18n.t('admin.products.prefix')
        end
        field :title_ge do
          label I18n.t('admin.products.title_ge')
        end
        field :model do
          label I18n.t('admin.products.model')
        end
        field :price do
          label I18n.t('admin.products.price')
          pretty_value do
            sprintf('%.2f', value)
          end
        end
        field :quantity do
          label I18n.t('admin.products.quantity')
        end
      end


      show do
        field :prefix do
          label I18n.t('admin.products.prefix')
        end
        field :sub_category_id do
          label I18n.t('admin.products.sub_category')
          render do
            bindings[:view].render :partial => 'my_partial', :locals => { :flight => bindings[:object], :field => self }
          end
        end
        field :title_ge do
          label I18n.t('admin.products.title_ge')
        end
        field :title_en do
          label I18n.t('admin.products.title_en')
        end
        field :sex_id, :enum do
          label I18n.t('admin.products.sex')
          enum do
            Sex.all.map { |c| [ c.sex_ge, c.id ] }
          end
        end
        field :brand do
          label I18n.t('admin.products.brand')
        end
        field :age_id, :enum do
          label I18n.t('admin.products.age')
          enum do
            Age.all.map { |c| [ c.age_ge, c.id ] }
          end
        end
        field :description_ge, :ck_editor do
          label I18n.t('admin.products.description_ge')
        end
        field :description_en, :ck_editor do
          label I18n.t('admin.products.description_en')
        end
        field :model do
          label I18n.t('admin.products.model')
        end
        field :price do
          label I18n.t('admin.products.price')
          pretty_value do
            sprintf('%.2f', value)
          end
        end
        field :discount do
          label I18n.t('admin.products.discount')
          pretty_value do
            sprintf('%.2f', value)
          end
        end
        field :quantity do
          label I18n.t('admin.products.quantity')
        end
        field :in_stock do
          label I18n.t('admin.products.in_stock')
        end
        #field :point
        #field :sex, :enum do
        #  enum do
        #    ["Free", "Basic", "Advanced", "Super Platinum"]
        #  end
        #end
        #configure :sex do
        #  partial "my_partial", :object => :category
        #end

        field :images do
          label I18n.t('admin.products.images')
        end
      end

      edit do
      field :prefix do
        label I18n.t('admin.products.prefix')
      end
      field :sub_category_id do
        label I18n.t('admin.products.sub_category')
        render do
          bindings[:view].render :partial => 'my_partial', :locals => { :flight => bindings[:object], :field => self }
        end
      end
      field :title_ge do
        label I18n.t('admin.products.title_ge')
      end
      field :title_en do
        label I18n.t('admin.products.title_en')
      end
      field :sex_id, :enum do
        label I18n.t('admin.products.sex')
        enum do
          Sex.all.map { |c| [ c.sex_ge, c.id ] }
        end
      end
      field :brand do
        label I18n.t('admin.products.brand')
      end
      field :age_id, :enum do
        label I18n.t('admin.products.age')
        enum do
          Age.all.map { |c| [ c.age_ge, c.id ] }
        end
      end
      field :description_ge, :ck_editor do
        label I18n.t('admin.products.description_ge')
      end
      field :description_en, :ck_editor do
        label I18n.t('admin.products.description_en')
      end
      field :model do
        label I18n.t('admin.products.model')
      end
      field :price do
        label I18n.t('admin.products.price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :discount do
        label I18n.t('admin.products.discount')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :quantity do
        label I18n.t('admin.products.quantity')
      end
      field :in_stock do
        label I18n.t('admin.products.in_stock')
      end
      #field :point
      #field :sex, :enum do
      #  enum do
      #    ["Free", "Basic", "Advanced", "Super Platinum"]
      #  end
      #end
      #configure :sex do
      #  partial "my_partial", :object => :category
      #end

      field :images do
        label I18n.t('admin.products.images')
      end

      #
      #field :sub_category_id, :enum do
      #  enum do
      #    partial "my_partial"
      #  end
      #end

    end
  end

  config.model Transaction do
    label I18n.t('admin.transaction.menu_name')
    label_plural I18n.t('admin.transaction.menu_name')
    config.label_methods << :customer_id

    list do
      field :id
      field :description do
        label I18n.t('admin.transaction.description')
      end
      field :customer_id, :enum do
        label I18n.t('admin.transaction.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :amount do
        label I18n.t('admin.transaction.amount')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :created_at do
        label I18n.t('admin.transaction.created_at')
      end
    end

    edit do
      field :customer_id, :enum do
        label I18n.t('admin.transaction.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :description do
        label I18n.t('admin.transaction.description')
      end
      field :amount do
        label I18n.t('admin.transaction.amount')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end

    show do
      field :id
      field :description do
        label I18n.t('admin.transaction.description')
      end
      field :customer_id, :enum do
        label I18n.t('admin.transaction.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :amount do
        label I18n.t('admin.transaction.amount')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :created_at do
        label I18n.t('admin.transaction.created_at')
      end
    end
  end

  config.model Order do
    label I18n.t('admin.order.menu_name')
    label_plural I18n.t('admin.order.menu_name')
    config.label_methods << :status_ge

    list do
      field :id do
        formatted_value do
          $a = value
          bindings[:view].link_to(value, "order_product/?locale=ge&o=#{value}") << value
        end
      end
      field :invoice do
        label I18n.t('admin.order.invoice')
      end
      field :customer_id, :enum do
        label I18n.t('admin.order.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :total do
        label I18n.t('admin.order.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :status_id, :enum do
        label I18n.t('admin.order.status')
        enum do
          Status.all.map { |c| [ c.status_ge, c.id ] }
        end
      end
      field :created_at do
        label I18n.t('admin.order.created_at')
      end
      field :updated_at do
        label I18n.t('admin.order.updated_at')
      end
    end

    show do
      field :customer_id, :enum do
        label I18n.t('admin.order.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :first_name do
        label I18n.t('admin.order.first_name')
      end
      field :last_name do
        label I18n.t('admin.order.last_name')
      end
      field :payment_address do
        label I18n.t('admin.order.payment_address')
      end
      field :pid
      field :phone
      field :zip_code
      field :pay_type_id, :enum do
        label I18n.t('admin.order.payment_type')
        enum do
          PaymentMethod.all.map { |c| [ c.method_name_ge, c.id ] }
        end
      end
      field :payment_zone_id, :enum do
        label I18n.t('admin.order.payment_zone')
        enum do
          PaymentZone.all.map { |c| [ c.zone_name_ge, c.id ] }
        end
      end
      field :total do
        label I18n.t('admin.order.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :status_id, :enum do
       label I18n.t('admin.order.status')
       enum do
         Status.all.map { |c| [ c.status_ge, c.id ] }
       end
      end
    end

    edit do
      field :customer_id, :enum do
        label I18n.t('admin.order.full_name')
        enum do
          Customer.all.map { |c| [ "#{c.first_name} #{c.last_name}", c.id ] }
        end
      end
      field :first_name do
        label I18n.t('admin.order.first_name')
      end
      field :last_name do
        label I18n.t('admin.order.last_name')
      end
      field :payment_address do
        label I18n.t('admin.order.payment_address')
      end
      field :pid
      field :phone
      field :zip_code
      field :pay_type_id, :enum do
        label I18n.t('admin.order.payment_type')
        enum do
          PaymentMethod.all.map { |c| [ c.method_name_ge, c.id ] }
        end
      end
      field :payment_zone_id, :enum do
        label I18n.t('admin.order.payment_zone')
        enum do
          PaymentZone.all.map { |c| [ c.zone_name_ge, c.id ] }
        end
      end
      field :total do
        label I18n.t('admin.order.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :status_id, :enum do
        label I18n.t('admin.order.status')
        enum do
          Status.all.map { |c| [ c.status_ge, c.id ] }
        end
      end
    end
  end

  config.model OrderProduct do
    label I18n.t('admin.order_product.menu_name')
    label_plural I18n.t('admin.order_product.menu_name')

    list do
      field :order_id do
        label I18n.t('admin.order_product.order_id')
      end
      field :title do
        label I18n.t('admin.order_product.product_title')
      end
      field :model do
        label I18n.t('admin.order_product.model')
      end
      field :quantity do
        label I18n.t('admin.order_product.quantity')
      end
      field :per_price do
        label I18n.t('admin.order_product.per_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :total do
        label I18n.t('admin.order_product.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end
    show do
      field :order_id do
        label I18n.t('admin.order_product.order_id')
        formatted_value do
          bindings[:view].link_to(value, "../order/#{value}?locale=ge")
        end
      end
      field :title do
        label I18n.t('admin.order_product.product_title')
      end
      field :model do
        label I18n.t('admin.order_product.model')
      end
      field :quantity do
        label I18n.t('admin.order_product.quantity')
      end
      field :per_price do
        label I18n.t('admin.order_product.per_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :total do
        label I18n.t('admin.order_product.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end

    edit do
      field :title do
        label I18n.t('admin.order_product.product_title')
      end
      field :model do
        label I18n.t('admin.order_product.model')
      end
      field :quantity do
        label I18n.t('admin.order_product.quantity')
      end
      field :per_price do
        label I18n.t('admin.order_product.per_price')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
      field :total do
        label I18n.t('admin.order_product.total')
        pretty_value do
          sprintf('%.2f', value)
        end
      end
    end
  end

  config.model Customer do
    label I18n.t('admin.customer.menu_name')
    label_plural I18n.t('admin.customer.menu_name')
    list do
      field :id
      field :first_name do
        label I18n.t('admin.customer.first_name')
      end
      field :last_name do
        label I18n.t('admin.customer.last_name')
      end
      field :email do
        label I18n.t('admin.customer.email')
      end
      field :created_at do
        label I18n.t('admin.customer.created_at')
      end
    end

    show do
      field :id
      field :first_name do
        label I18n.t('admin.customer.first_name')
      end
      field :last_name do
        label I18n.t('admin.customer.last_name')
      end
      field :email do
        label I18n.t('admin.customer.email')
      end
      field :phone do
        label I18n.t('admin.customer.phone')
      end
      field :pid do
        label I18n.t('admin.customer.pid')
      end
      field :address do
        label I18n.t('admin.customer.address')
      end
      field :email do
        label I18n.t('admin.customer.email')
      end
      field :payment_zone_id, :enum do
        label I18n.t('admin.customer.payment_zone')
        enum do
          PaymentZone.all.map { |c| [ c.zone_name_ge, c.id ] }
        end
      end
      field :zip_code do
        label I18n.t('admin.customer.zip_code')
      end
      field :sign_in_count do
        label I18n.t('admin.customer.sign_in_count')
      end
      field :current_sign_in_ip do
        label I18n.t('admin.customer.current_ip')
      end
      field :last_sign_in_ip do
        label I18n.t('admin.customer.last_ip')
      end

      field :created_at do
        label I18n.t('admin.customer.created_at')
      end
      field :updated_at do
        label I18n.t('admin.customer.updated_at')
      end
    end


    edit do
      field :first_name do
        label I18n.t('admin.customer.first_name')
      end
      field :last_name do
        label I18n.t('admin.customer.last_name')
      end
      field :email do
        label I18n.t('admin.customer.email')
      end
      field :phone do
        label I18n.t('admin.customer.phone')
      end
      field :pid do
        label I18n.t('admin.customer.pid')
      end
      field :address do
        label I18n.t('admin.customer.address')
      end
      field :email do
        label I18n.t('admin.customer.email')
      end
      field :payment_zone_id, :enum do
        label I18n.t('admin.customer.payment_zone')
        enum do
          PaymentZone.all.map { |c| [ c.zone_name_ge, c.id ] }
        end
      end
      field :zip_code do
        label I18n.t('admin.customer.zip_code')
      end
      field :sign_in_count do
        label I18n.t('admin.customer.sign_in_count')
      end
      field :current_sign_in_ip do
        label I18n.t('admin.customer.current_ip')
      end
      field :last_sign_in_ip do
        label I18n.t('admin.customer.last_ip')
      end

      field :created_at do
        label I18n.t('admin.customer.created_at')
      end
      field :updated_at do
        label I18n.t('admin.customer.updated_at')
      end
    end
  end

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Wunderkind', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated
  #config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  config.excluded_models = [Cart, LineItem, Authentication, Logs]

  # Include specific models (exclude the others):
  # config.included_models = []

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:


end
