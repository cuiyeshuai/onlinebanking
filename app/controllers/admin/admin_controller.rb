class Admin::AdminController < ApplicationController
  include Admin::SessionsHelper
  layout "admin"

  after_action :recordPath
  before_action :authorityCheck
  def authorityCheck
    render :file => 'public/404.html', status => :not_found, :layout => false unless logged_in_as_administrator?
  end

  def recordPath
    session[:previous_page] ||= request.referer
  end
end
