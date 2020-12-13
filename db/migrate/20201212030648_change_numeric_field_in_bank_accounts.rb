class ChangeNumericFieldInBankAccounts < ActiveRecord::Migration[6.0]
  def change
    change_column :bank_accounts, :amount, :decimal, :precision => 10, :scale =>2
  end
end
