class AddNameToFurniture < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :name, :string
  end
end
