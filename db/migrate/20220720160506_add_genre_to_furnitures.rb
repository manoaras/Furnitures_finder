class AddGenreToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :genre, :string
  end
end
