class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
    	t.string :title
    	t.date :duedate
    	t.text :plan
    	t.text :do_what 
    	t.text :check
    	t.text :act

      t.timestamps
    end
  end
end
