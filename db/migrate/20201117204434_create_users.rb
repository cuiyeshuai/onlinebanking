class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, :unique => true, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password, null: false
      t.integer :gender, null: false
      t.date :date_of_birth, null: false
      t.string :phone_number, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
