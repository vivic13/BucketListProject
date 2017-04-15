class RemoveColumnOnDonation < ActiveRecord::Migration[5.0]
  def change
  	remove_column :donations, :cc_num
  	remove_column :donations,	:cc_last
  	remove_column :donations,	:cc_duedate

  end
end
