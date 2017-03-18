class DeleteColumnFollowerOnPlans < ActiveRecord::Migration[5.0]
  def change
  	remove_column :plans, :follower
  end
end
