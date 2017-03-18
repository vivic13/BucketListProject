class ChangeColumnOnPlans < ActiveRecord::Migration[5.0]
  def change
  	add_column :plans, :host, :string
  	add_column :plans, :follower, :string
  	remove_column :plans, :user_id 
  end
end
