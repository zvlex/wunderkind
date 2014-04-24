module ProductsHelper
  def prefix_product_list(pid, cat_id, product_id)
    Product.where('sub_category_id = ?', cat_id)
           .where('prefix_id = ?', pid)
           .order("CASE WHEN products.id = #{product_id} THEN 1 ELSE 2 END, products.id")
  end

  def related_product_prefix_list(cat_id)
    Prefix.joins('LEFT JOIN products as p ON p.prefix_id = prefixes.id')
          .where('sub_category_id = ? AND quantity > 0', cat_id).order('RAND()').limit(3).select('*')
  end

  def search_product_list(search, prefix)
    @products = Product.where("title_#{get_loc} LIKE ? AND prefix_id = ? AND quantity > 0", "%#{search}%", prefix)
  end



  def filter_product_list(sub, brand, age, sex, cond_1, cond_2, cond_3, cond_4, price_min, price_max, prefix)
    Product.joins('LEFT JOIN prefixes ON (prefixes.id = products.prefix_id)')
    .search_with_sub2(sub, brand, age, sex, cond_1, cond_2, cond_3, cond_4, price_min, price_max, prefix)
  end


end
