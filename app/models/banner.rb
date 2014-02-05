class Banner < ActiveRecord::Base
  has_attached_file :img_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img_url, :content_type => /\Aimage\/.*\Z/

  has_attached_file :img_url
  #attr_accessible :asset, :asset_cache, :remove_asset

  validates :title, presence: true


  rails_admin do

    list do
      field :id
      field :title
      field :status
      field :img_url
    end

    edit do
      field :title
      field :status
      field :img_url, :paperclip
    end

  end
end
