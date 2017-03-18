class DropDonation < ActiveRecord::Migration[5.0]
  def change
  	drop_table :donations
  end
end
