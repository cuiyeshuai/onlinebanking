class ApplicationController < ActionController::Base
  include SessionsHelper
  include BankAccountsHelper
  include Admin::SessionsHelper
end
