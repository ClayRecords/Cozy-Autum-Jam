current_ingredients = [];
recipes = [instance_create_layer(x, y, "Instances", obj_recipe_invisibility)];
current_potion = undefined;

function add_ingredient(ingredient) {
	array_push(current_ingredients, ingredient);
	evaluate_recipes();
    audio_play_sound(choose(snd_bubble1, snd_bubble2, snd_bubble3, snd_bubble4), 1, false);
}

function evaluate_recipes() {
	current_potion = undefined;
	if (array_length(current_ingredients) == 0) {
		return;
	}

	for (var i = 0; i <= array_length(recipes) - 1; i++) {
		var recipe = recipes[i];
		if (evaluate_recipe(recipe)) {
			current_potion = recipe.recipe_potion;
		}
	}
}

function evaluate_recipe(recipe) {
	var recipe_ingredients = recipe.recipe_ingredients;
	var recipe_length = array_length(recipe_ingredients);

	// Check if the test ingredients will make this recipe, return bool
	if (recipe_length != array_length(current_ingredients)) {
		return false;
	}
	for (i = 0; i <= array_length(current_ingredients) - 1; i++) {
		if (recipe_ingredients[i] != current_ingredients[i]) {
			return false;
		}
	}
	return true;
}

function flush() {
	current_ingredients = [];
	evaluate_recipes();
}
