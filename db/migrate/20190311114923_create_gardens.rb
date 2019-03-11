class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :adress
      t.timestamps
    end
  end
end
