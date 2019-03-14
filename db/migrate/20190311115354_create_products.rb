class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.belongs_to :garden, index: true
      t.string :name
      t.timestamps
    end
  end
end
