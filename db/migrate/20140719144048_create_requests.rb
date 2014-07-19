class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :content
      t.integer :user_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
