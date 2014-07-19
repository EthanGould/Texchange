class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :word
      t.text :definition
      t.string :language

      t.timestamps
    end
  end
end
