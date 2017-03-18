class ChangeColumnCcDuedate < ActiveRecord::Migration[5.0]
  def change
  	change_column :actions, :cc_duedate, :date
  end
end
