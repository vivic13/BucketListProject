class AddUserLoginInfo < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nickname, :string
  	add_column :users, :last_name, :string
  end
end
