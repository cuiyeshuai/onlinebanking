class Admin::AdminController < ApplicationController
  include Admin::SessionsHelper
  before_action :authorityCheck
  def authorityCheck
    render :file => 'public/404.html', status => :not_found, :layout => false unless logged_in_as_administrator?
  end
end
