class ChangeImgaeOnPlans < ActiveRecord::Migration[5.0]
  def change
  	remove_column :plans, :file_location
  	add_attachment :plans, :file_location
  end
end
