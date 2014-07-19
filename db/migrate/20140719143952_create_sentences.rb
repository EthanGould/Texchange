class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :content
      t.integer :teacher
      t.string :language
      t.integer :points

      t.timestamps
    end
  end
end
