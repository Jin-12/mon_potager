class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commentable_type 
      t.integer :commentable_id
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
