class AddCommenterOnComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :commenter, :string
  end
end
