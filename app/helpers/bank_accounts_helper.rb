module BankAccountsHelper

    def set_account(acc)
        session[:current_bank_account_id] = acc.id
        @bankAcc = acc
    end

    def current_account
        
    end

    def get_account
        
    end

end
