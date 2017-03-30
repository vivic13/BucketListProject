class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
    	t.attachment :image
    	t.integer :plan_id
      t.timestamps
    end
  end
end
