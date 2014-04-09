class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :not_referenced_any_line_items

  has_many :images
  belongs_to :prefix
  belongs_to :brand
  belongs_to :category
  belongs_to :sub_category
  belongs_to :sex
  belongs_to :age
  attr_accessor :product_img
  accepts_nested_attributes_for :images, :allow_destroy => true

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



  def self.search_with_sub2(sub, brand, age, sex, cond_1, cond_2, cond_3, cond_4, price_min, price_max, prefix)
    if cond_3
      if cond_4
        where('sex_id IN (?) OR sub_category_id = ?', sex, sub)
        .where('price BETWEEN ? AND ? AND prefix_id = ? AND quantity > 0', price_min, price_max, prefix)
      else
        where('sex_id IN (?) AND sub_category_id = ?', sex, sub)
        .where('price BETWEEN ? AND ? AND prefix_id = ? AND quantity > 0', price_min, price_max, prefix)
      end
    else
      if cond_2
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age).where('sex_id IN (?)', sex).where('sub_category_id = ?', sub)
        .where('price BETWEEN ? AND ? AND prefix_id = ? AND quantity > 0', price_min, price_max, prefix)
      else
        where("brand_id IN (?) #{cond_1} age_id IN (?)", brand, age).where('sub_category_id = ?', sub)
        .where('price BETWEEN ? AND ? AND prefix_id = ? AND quantity > 0', price_min, price_max, prefix)
      end
    end
  end



    #label I18n.t('admin.products.menu_name')
    #label_plural I18n.t('admin.products.menu_name')
    #list do
    #  field :id
    #  field :product_img do
    #    formatted_value do
    #      bindings[:view].tag(:img, { :src => bindings[:object].images.first.product_img(:list) }) << value
    #    end
    #    label I18n.t('admin.products.images')
    #  end
    #  field :prefix do
    #    label I18n.t('admin.products.prefix')
    #  end
    #  field :title_ge do
    #    label I18n.t('admin.products.title_ge')
    #  end
    #  field :model do
    #    label I18n.t('admin.products.model')
    #  end
    #  field :price do
    #    label I18n.t('admin.products.price')
    #  end
    #  field :quantity do
    #    label I18n.t('admin.products.quantity')
    #  end
    #end


  private

    def not_referenced_any_line_items
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
