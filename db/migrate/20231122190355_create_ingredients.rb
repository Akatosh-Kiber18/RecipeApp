class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :calories
      t.float :fats
      t.float :proteins

      t.timestamps
    end
  end
end
