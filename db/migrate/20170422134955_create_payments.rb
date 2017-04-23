class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.integer :donation_id
    	t.string :payment_method
    	t.integer :amount
    	t.datetime :paid_at
    	t.text :params
      t.timestamps
    end
    add_index :payments, :donation_id

	  add_column :donations, :status, :string, :default => "pending"
		add_column :donations, :payment_status, :string, :default => "pending"
  end
end
