class StaticPage < ActiveRecord::Base
  validates :title_ge, presence: true
  validates :title_en, presence: true
  validates :content_ge, presence: true


  rails_admin do
    list do
      field :id
      field :title_ge
      field :title_en
      field :status
    end

    show do
      field :title_ge
      field :title_en
      field :status do
        label "Active?"
      end
    end

    edit do
      field :title_ge
      field :title_en
      field :content_ge, :ck_editor
      field :content_en, :ck_editor
      field :status do
        label "Active?"
      end
    end
  end
end
