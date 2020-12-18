require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
    def setup
        # @user = User.new({username: "Jiaqing", password: "123456",password_confirmation: "123456", first_name: "Jiaqing", last_name:"Nie", date_of_birth: Time.local(1999,10,21), phone_number: "11111111111", address: "E1 4EY", gender: 1})
        # @bankAccount = BankAccount.new({amount: 4, currency: "EUR", type_of_account: "savings", user_id: @user.id})
        # @transaction = Transaction.new({})
        @transaction = transactions(:one)
    end
     
    test "default transaction should be valid" do
        assert @transaction.valid?
    end

end
