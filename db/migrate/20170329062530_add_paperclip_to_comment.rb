class AddPaperclipToComment < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :comments, :image
  end
end
