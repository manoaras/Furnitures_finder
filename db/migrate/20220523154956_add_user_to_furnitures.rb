class AddUserToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_reference :furnitures, :user, null: false, foreign_key: true
  end
end
