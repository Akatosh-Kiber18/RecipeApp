class AddDefaultValuesToIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ingredients, :calories, 0
    change_column_default :ingredients, :fats, 0
    change_column_default :ingredients, :proteins, 0
  end
end