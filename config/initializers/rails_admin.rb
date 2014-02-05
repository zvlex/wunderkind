# RailsAdmin config file. Generated on January 15, 2014 14:19
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  config.model SubCategory do
    config.label_methods << :title_ge
  end

  config.model Product do
      config.label_methods << :prefix_ge
      config.label_methods << :title_ge
      config.label_methods << :category
      config.label_methods << :sex_ge

    edit do
      field :prefix
      field :title_ge
      field :title_en
      field :description_ge, :ck_editor
      field :description_en, :ck_editor
      field :model
      field :price
      field :discount
      field :brand
      field :in_stock
      field :quantity
      field :sub_category_id do
        render do
          bindings[:view].render :partial => 'my_partial', :locals => { :flight => bindings[:object], :field => self }
        end
      end
      configure :sex do
        label "Sex"
      end

      #field :sex, :enum do
      #  enum do
      #    ["Free", "Basic", "Advanced", "Super Platinum"]
      #  end
      #end
      #configure :sex do
      #  partial "my_partial", :object => :category
      #end
      field :sex_id, :enum do
        enum do
          Sex.all.map { |c| [ c.sex_ge, c.id ] }
        end
      end
      #
      #field :sub_category_id, :enum do
      #  enum do
      #    partial "my_partial"
      #  end
      #end



    end
  end

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Wunderkind', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = []

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
