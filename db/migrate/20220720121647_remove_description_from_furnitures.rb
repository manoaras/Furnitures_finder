class RemoveDescriptionFromFurnitures < ActiveRecord::Migration[7.0]
  def change
    remove_column :furnitures, :description
  end
end
