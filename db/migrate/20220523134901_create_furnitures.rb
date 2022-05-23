class CreateFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :furnitures do |t|
      t.string :description
      t.integer :price_per_day

      t.timestamps
    end
  end
end
