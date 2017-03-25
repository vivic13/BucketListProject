class AddDefaultValue < ActiveRecord::Migration[5.0]
  def change
  	change_column :plans, :progress, :string, :default => "剛決定願望"
  end
end
