class DeleteBankAccountIdColumnFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :bank_account_id
  end
end
