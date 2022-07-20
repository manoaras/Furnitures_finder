class AddDescriptionToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :description, :text
  end
end
