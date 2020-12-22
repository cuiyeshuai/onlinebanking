class Admin::StylesController < Admin::AdminController
  def create
    cookies[:style] = params[:style_theme]
    redirect_to admin_index_path
  end
end
