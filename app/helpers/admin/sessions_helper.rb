module Admin::SessionsHelper
  def log_in(administrator)
    session[:administrator_id] = administrator.id
  end

  def current_user
    if session[:administrator_id]
      Administator.findBy[id: session[:administrator_id]]
    end
  end

  def logged_in?
    !current_administrator.nil?
  end

  def log_out
    session.delete(:administrator_id)
  end

end
