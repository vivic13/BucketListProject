class Defaul2 < ActiveRecord::Migration[5.0]
  def change
  	change_column :plans, :file_location, :string
  end
end
