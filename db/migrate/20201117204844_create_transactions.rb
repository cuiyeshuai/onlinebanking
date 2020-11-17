class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :currency, null: false
      t.decimal :amount, null: false, :precision => 2
      t.string :recipient_name, null: false
      t.integer :recipient, null: false
      t.string :reference
      t.timestamp :date
      t.belongs_to :bank_account

      t.timestamps
    end
  end
end
