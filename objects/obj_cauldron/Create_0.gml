current_ingredients = [];
recipes = [instance_create_layer(x, y, "Instances", obj_recipe_invisibility)];
current_potion = undefined;

function add_ingredient(ingredient) {
	array_push(current_ingredients, ingredient);
	recipe_evaluate();
}

function flush() {
	current_ingredients = [];
	recipe_evaluate();
}

function recipe_evaluate() {
	current_potion = undefined;
	if (array_length(current_ingredients) == 0) {
		return;
	}
	for (i = 0; i <= array_length(recipes) - 1; i++) {
		print(i);
		current_recipe = recipes[i];
		if (evaluate_ingredients(current_recipe.recipe_ingredients)) {
			current_potion = current_recipe.recipe_potion;
		}
	}
}

function evaluate_ingredients(recipe_ingredients) {
	// Check if the test ingredients will make this recipe, return bool
	if (array_length(recipe_ingredients) != array_length(current_ingredients)) {
		return false;
	}
	return true;
}
