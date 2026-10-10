draw_self();

if (ingredient != undefined) {
	var sprite = object_get_sprite(ingredient);
	if (sprite_exists(sprite)) {
		draw_sprite(sprite, 0, x, y);
	}
}
