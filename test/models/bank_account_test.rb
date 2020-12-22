require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  def setup
     @bankAccount = bank_accounts(:bank1)
  end


  test "default bank account should be valid" do
    assert @bankAccount.valid?
  end

end
