module BankAccountsHelper

    def set_account(account)
        @bankAccount[:id] = account.id
    end

    def current_account
        if(@bankAccount[:id])
            BankAccount.find_by(id: @bankAccount[:id] )
        else

        end
    end

    def get_account
        
    end

end
