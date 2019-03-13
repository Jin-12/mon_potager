class CreateHarvests < ActiveRecord::Migration[5.2]
  def change
    create_table :harvests do |t|
      t.belongs_to :garden, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
