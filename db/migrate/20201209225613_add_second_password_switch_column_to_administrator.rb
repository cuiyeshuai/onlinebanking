class AddSecondPasswordSwitchColumnToAdministrator < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :second_password_enabled, :boolean, :default=>false
  end
end
