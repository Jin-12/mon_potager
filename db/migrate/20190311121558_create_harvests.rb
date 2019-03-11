class CreateHarvests < ActiveRecord::Migration[5.2]
  def change
    create_table :harvests do |t|

      t.timestamps
    end
  end
end
