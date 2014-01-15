module StaticPagesHelper
  def get_loc
    params[:locale] ||= 'ge'
  end
end
