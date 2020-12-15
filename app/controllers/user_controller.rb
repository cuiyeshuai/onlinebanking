class UserController < ApplicationController
  include SessionsHelper
  before_action :authorityCheck
  def authorityCheck
    render :file => 'public/404.html', status => :not_found, :layout => false unless logged_in?
  end
end
