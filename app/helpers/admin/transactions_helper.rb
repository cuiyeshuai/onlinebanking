module Admin::TransactionsHelper
  
    def generate_transactions(amount,user,bankacc)
        amount/2.times{
        t = Transaction.new
        t.currency = BankAccount.find(bankacc).currency
        t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
        t.recipient = User.find(user).first_name + User.find(user).last_name 
        t.recipient_account = bankacc
        t.reference = Faker::Restaurant.name  
        t.remitter_account = Faker::Bank.account_number(digits: 8)
        t.remitter = Faker::Restaurant.name  
        t.save
        }
        amount/2.times{
            t = Transaction.new
            t.currency = BankAccount.find(bankacc).currency
            t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
            t.recipient = Faker::Company.name  
            t.recipient_account = Faker::Bank.account_number(digits: 8)
            t.reference = Faker::Company.name  
            t.remitter_account = bankacc
            t.remitter = User.find(user).first_name + User.find(user).last_name
            t.save
            }
    end
end
