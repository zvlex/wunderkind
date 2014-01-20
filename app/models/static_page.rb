class StaticPage < ActiveRecord::Base
  validates :title_ge, presence: true
  validates :title_en, presence: true
  validates :content_ge, presence: true
end
