class AddSecondPasswordColumnToAdministrator < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :second_password_digest, :string, :default => ""
  end
end
