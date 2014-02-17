module ProductsHelper
  def prefix_product_list(pid, cat_id, product_id)
    Product.where('sub_category_id = ?', cat_id)
           .where('prefix_id = ?', pid)
           .order("CASE WHEN products.id = #{product_id} THEN 1 ELSE 2 END, products.id")
  end

  def related_product_prefix_list(cat_id)
    Prefix.joins('LEFT JOIN products as p ON p.prefix_id = prefixes.id')
          .where('sub_category_id = ?', cat_id).order('RAND()').limit(3).select('*')
  end


end
