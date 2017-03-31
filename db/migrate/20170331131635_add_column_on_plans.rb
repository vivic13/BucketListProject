class AddColumnOnPlans < ActiveRecord::Migration[5.0]
  def change
  	add_column :plans, :page_view, :integer, :default => 0, :null => false
  end
end
