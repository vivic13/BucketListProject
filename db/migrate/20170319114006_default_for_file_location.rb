class DefaultForFileLocation < ActiveRecord::Migration[5.0]
  def change
  	 change_column :plans, :file_location, :string, :default => "default.png"
  end
end
