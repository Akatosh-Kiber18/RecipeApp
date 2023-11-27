class AddWeightToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :weight, :float
  end
end
