class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :location
      t.text :word
      t.text :definition
      t.string :language
      t.text :sentence
      t.integer :points

      t.timestamps
    end
  end
end
