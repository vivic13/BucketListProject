class AddDefaultValueToIsPublic < ActiveRecord::Migration[5.0]
  def change
  	 change_column :plans, :is_public, :boolean, :default => false
  end
end
