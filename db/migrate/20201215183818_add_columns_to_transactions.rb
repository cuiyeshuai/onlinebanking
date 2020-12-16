class AddColumnsToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :remitter_account, :integer
    add_column :transactions, :remitter, :string
  end
end
