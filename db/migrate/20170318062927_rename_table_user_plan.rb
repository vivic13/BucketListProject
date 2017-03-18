class RenameTableUserPlan < ActiveRecord::Migration[5.0]
  def change
  	rename_table :user_plans, :memberships
  end
end
