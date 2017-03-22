class AddColumnsOnUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :introduction, :text
  	add_column :plans, :why, :text
  end
end
