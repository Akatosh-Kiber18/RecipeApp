recipe = Recipe.create(title: 'Spaghetti Bolognese', instructions: 'Cook spaghetti and prepare Bolognese sauce.')
ingredient1 = Ingredient.create(name: 'Spaghetti', weight: 350, calories: 200, fats: 1, proteins: 8, recipe: recipe)
ingredient2 = Ingredient.create(name: 'Tomato Sauce', weight: 150, calories: 50, fats: 2, proteins: 1, recipe: recipe)
