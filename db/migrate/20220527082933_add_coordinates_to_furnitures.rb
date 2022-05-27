class AddCoordinatesToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :latitude, :float
    add_column :furnitures, :longitude, :float
  end
end
