module ApplicationHelper
  def full_title(page_title)
    base_title = 'Online Shop'
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  def get_loc
    params[:locale] ||= 'ge'
  end

  def product_image(pid)
    Image.where('product_id = ?', pid).limit(1)
  end

end
