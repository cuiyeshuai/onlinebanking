class ChangeColumnsToTransactions < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :recipient, :recipient_account
    rename_column :transactions, :recipient_name, :recipient
  end
end
