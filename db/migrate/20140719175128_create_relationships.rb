class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
    add_index :relationships, :student_id
    add_index :relationships, :teacher_id
    add_index :relationships, [:student_id, :teacher_id], unique: true
  end
end
