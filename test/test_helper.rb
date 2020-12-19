ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :administrators, :users, :bank_accounts, :transactions

  # Add more helper methods to be used by all tests here...
  def user_is_logged_in?
    !session[:user_id].nil?
  end

  def admin_is_logged_in?
    !session[:administrator_id].nil?
  end

end

class ActionDispatch::IntegrationTest
  def log_in_as_user(user, password)
    post login_url, params: { username: user,  password: password}
  end

  def log_in_as_admin(admin, password)
    post admin_new_url, params: { administratorname: admin, password: password}
  end
end