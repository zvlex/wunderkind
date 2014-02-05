class Brand < ActiveRecord::Base
  has_one :product
  validates :title_ge, presence: true
  validates :title_en, presence: true

  rails_admin do
    list do
      field :id
      field :title_ge
      field :title_en
    end

    edit do
      field :title_ge
      field :title_en
    end
  end
end
