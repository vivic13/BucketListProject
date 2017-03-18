class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
    	t.string	:cc_name
    	t.integer :amount
    	t.integer :cc_num
    	t.integer :cc_last
    	t.integer :cc_duedate
    	t.integer :plan_id
    	t.integer :npo_id
      t.timestamps
    end
	   add_index :actions, :plan_id
	   add_index :actions, :npo_id
   
  end
end
