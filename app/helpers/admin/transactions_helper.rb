module Admin::TransactionsHelper

    def generate_transactions(amount,user,bankacc)
        if BankAccount.find(bankacc).currency == 'EUR'
            Faker::Config.locale = 'es-MX'
        end
        if BankAccount.find(bankacc).currency == 'USD'
            Faker::Config.locale = 'en-US'
        end
        if amount < 6
            amount.times {
            t = Transaction.new
            t.currency = BankAccount.find(bankacc).currency
            t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
            t.recipient = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ')
            t.recipient_account = bankacc
            t.reference = ["For",Faker::Restaurant.name].join(' ').squeeze(' ')
            t.remitter_account = Faker::Bank.account_number(digits: 8)
            t.remitter = Faker::Name.name 
            t.created_at = Faker::Date.between(from: '2019-09-23', to: Date.today)
            t.save
            }
        else
            @count = amount
            loop do  
                t = Transaction.new
                t.currency = BankAccount.find(bankacc).currency
                t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
                t.recipient = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ')
                t.recipient_account = bankacc
                t.reference = Faker::Invoice.reference
                t.remitter_account = Faker::Bank.account_number(digits: 8)
                t.remitter = Faker::Company.name  
                t.created_at = Faker::Date.between(from: '2016-09-23', to: Date.today)
                t.save
                @count= @count-1
                if @count==0
                    break
                end
                t = Transaction.new
                t.currency = BankAccount.find(bankacc).currency
                t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
                t.recipient = Faker::Restaurant.name 
                t.recipient_account = Faker::Bank.account_number(digits: 8)
                t.reference = Faker::Restaurant.type  
                t.remitter_account = bankacc
                t.remitter = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ') 
                t.created_at = Faker::Date.between(from: '2016-09-23', to: Date.today)
                t.save
                @count= @count-1
                if @count==0
                    break
                end
                t = Transaction.new
                t.currency = BankAccount.find(bankacc).currency
                t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
                t.recipient = Faker::Company.name  
                t.recipient_account = Faker::Bank.account_number(digits: 8)
                t.reference = Faker::Invoice.creditor_reference  #find reff
                t.remitter_account = bankacc
                t.remitter = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ')
                t.created_at = Faker::Date.between(from: '2016-09-23', to: Date.today)
                t.save
                @count= @count-1
                if @count==0
                    break
                end
                t = Transaction.new
                t.currency = BankAccount.find(bankacc).currency
                t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
                t.recipient = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ')
                t.recipient_account = bankacc
                t.reference = ["For invesment in",Faker::Finance.ticker].join(' ').squeeze(' ')
                t.remitter_account = Faker::Bank.account_number(digits: 8)
                t.remitter = Faker::Finance.ticker
                t.created_at = Faker::Date.between(from: '2015-09-23', to: Date.today)
                t.save
                @count= @count-1
                if @count==0
                    break
                end
                
                t = Transaction.new
                t.currency = BankAccount.find(bankacc).currency
                t.amount = Faker::Number.decimal(l_digits: 2, r_digits: 2)
                t.recipient = [User.find(user).first_name, User.find(user).last_name ].join(' ').squeeze(' ')
                t.recipient_account = bankacc
                t.reference = ["For",Faker::Restaurant.name].join(' ').squeeze(' ')
                t.remitter_account = Faker::Bank.account_number(digits: 8)
                t.remitter = Faker::Name.name 
                t.created_at = Faker::Date.between(from: '2015-09-23', to: Date.today)
                t.save
                @count= @count-1
                if @count==0
                    break
                end
            end
            
        end
    end
end
