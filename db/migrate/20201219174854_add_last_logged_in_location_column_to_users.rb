class AddLastLoggedInLocationColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_logged_in_location, :string, :default =>" -- -- "
  end
end
