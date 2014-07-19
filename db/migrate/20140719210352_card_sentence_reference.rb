class CardSentenceReference < ActiveRecord::Migration
  def change
  	change_table :sentences do |t|
  		t.references :card, index:true
  	end
  end
end
