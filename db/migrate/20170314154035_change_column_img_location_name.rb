class ChangeColumnImgLocationName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :plans, :img_location, :file_location
  end
end
