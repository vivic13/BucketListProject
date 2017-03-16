class CreateComment < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

    	t.string :commentor
    	t.text :comment_body
    	t.integer :plan_id

    end
    add_index :comments, :plan_id
  end
end
