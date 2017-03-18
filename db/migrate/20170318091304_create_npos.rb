class CreateNpos < ActiveRecord::Migration[5.0]
  def change
    create_table :npos do |t|
    	t.integer :npo_code
    	t.string :name
      t.timestamps
    end
  end
end
