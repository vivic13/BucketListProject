class CreateTagPlanRps < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_plan_rps do |t|
    	t.integer :plan_id
    	t.integer :tag_category_id
      t.timestamps
    end
  end
end
