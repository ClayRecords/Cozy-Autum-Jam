current_ingredients = [];
current_potion = undefined;

potion_indexes = [obj_potion_invisibility];
potions = [];
for (var i = 0; i <= array_length(potion_indexes) - 1; i++) {
	var potion_index = potion_indexes[i];
	var potion = instance_create_layer(x, y, "invisible", potion_index);
	array_push(potions, potion);
}

function add_ingredient(ingredient) {
	array_push(current_ingredients, ingredient);
	evaluate_recipes();
	audio_play_sound(
		choose(snd_bubble1, snd_bubble2, snd_bubble3, snd_bubble4),
		1,
		false
	);
}

function evaluate_recipes() {
	current_potion = undefined;
	if (array_length(current_ingredients) == 0) {
		return;
	}

	for (var i = 0; i <= array_length(potions) - 1; i++) {
		var potion = potions[i];
		if (evaluate_recipe(potion)) {
			current_potion = potion;
		}
	}
}

function evaluate_recipe(potion) {
	var recipe_length = array_length(potion.recipe);

	// Check if the test ingredients will make this recipe, return bool
	if (recipe_length != array_length(current_ingredients)) {
		return false;
	}
	for (i = 0; i <= array_length(current_ingredients) - 1; i++) {
		if (potion.recipe[i] != current_ingredients[i]) {
			return false;
		}
	}
	return true;
}

function flush() {
	current_ingredients = [];
	evaluate_recipes();
}
