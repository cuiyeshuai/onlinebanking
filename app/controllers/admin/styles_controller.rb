class Admin::StylesController < Admin::AdminController
  def create
    cookies[:style] = params[:style_theme]
  end
end
