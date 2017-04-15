class AddColumnOnDonation < ActiveRecord::Migration[5.0]
  def change
  	add_column :donations, :user_id, :integer
  	add_index :donations, :user_id

  end
end
