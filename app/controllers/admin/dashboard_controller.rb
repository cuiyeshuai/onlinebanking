class Admin::DashboardController < ApplicationController
  include Admin::SessionsHelper
  def index
    if (!logged_in_as_administrator?)
      redirect_to '/admin'
    end
    @color = 'blue'
    @administrator = current_administrator
  end
end
