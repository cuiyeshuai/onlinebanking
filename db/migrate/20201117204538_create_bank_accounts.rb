class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.decimal :amount, null: false, :precision => 2
      t.string :currency, null: false
      t.string :type_of_account, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
