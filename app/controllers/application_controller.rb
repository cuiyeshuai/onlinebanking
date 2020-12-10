class ApplicationController < ActionController::Base
  include SessionsHelper
  include BankAccountsHelper
end
