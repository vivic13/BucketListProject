class CreateUserPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :user_plans do |t|
    	t.integer :user_id
    	t.integer :plan_id

      t.timestamps
    end
    	add_index :user_plans, :user_id
    	add_index :user_plans, :plan_id
  end
end
