class RemoveCommentorOnComments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :comments, :commentor
  end
end
