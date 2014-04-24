class Prefix < ActiveRecord::Base
  has_one :product
  validates :prefix_ge, presence: true
  validates :prefix_en, presence: true

  def self.search_with_sub(sub, brand, age, sex, cond_1, cond_2, cond_3, cond_4, price_min, price_max)
    if cond_3
      if cond_4
        where('sex_id IN (?) OR sub_category_id = ?', sex, sub)
        .where('price BETWEEN ? AND ?', price_min, price_max)
      else
        where('sex_id IN (?) AND sub_category_id = ?', sex, sub)
        .where('price BETWEEN ? AND ?', price_min, price_max)
      end
    else
      if cond_2
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age).where('sex_id IN (?)', sex).where('sub_category_id = ?', sub)
        .where('price BETWEEN ? AND ?', price_min, price_max)
      else
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age).where('sub_category_id = ?', sub)
        .where('price BETWEEN ? AND ?', price_min, price_max)
      end
    end
  end

  def self.search_without_sub(brand, age, sex, cond_1, cond_2, cond_3, price_min, price_max)
    if cond_3
      where('sex_id IN (?)', sex).where('price BETWEEN ? AND ? AND quantity > 0', price_min, price_max)
    else
      if cond_2
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age).where('sex_id IN (?)', sex)
        .where('price BETWEEN ? AND ? AND quantity > 0', price_min, price_max)
      else
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age)
        .where('price BETWEEN ? AND ? AND quantity > 0', price_min, price_max)
      end
    end
  end

  rails_admin do
    label I18n.t('admin.prefix.menu_name')
    label_plural I18n.t('admin.prefix.menu_name')
    list do
      field :id
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end

    show do
      field :id
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end

    edit do
      field :prefix_ge do
        label I18n.t('admin.prefix.prefix_ge')
      end
      field :prefix_en do
        label I18n.t('admin.prefix.prefix_en')
      end
    end
  end

end
