class AddPictureToCard < ActiveRecord::Migration
  def change
  	add_column :cards, :picture, :text
  end
end
