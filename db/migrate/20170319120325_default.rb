class Default < ActiveRecord::Migration[5.0]
  def change
  	change_column :plans, :file_location, :integer
  end
end
