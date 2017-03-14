class AddProgressColumnToPlans < ActiveRecord::Migration[5.0]
  def change
  	add_column :plans, :progress, :string
  end
end
