module Admin::SessionsHelper
  def log_in_as_administrator(administrator)
    session[:administrator_id] = administrator.id
  end

  def current_administrator
    if session[:administrator_id]
      Administrator.find_by(id: session[:administrator_id])
    end
  end

  def logged_in_as_administrator?
    !current_administrator.nil?
  end

  def log_out_from_administrator
    session.delete(:administrator_id)
  end

end
