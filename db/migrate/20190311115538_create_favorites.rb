class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :favoritable_type 
      t.integer :favoritable_id
      t.integer :user_id
      t.timestamps
    end
  end
end
