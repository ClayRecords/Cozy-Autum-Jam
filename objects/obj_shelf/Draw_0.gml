draw_self();

// Draw item on shelf
if (ingredient != undefined) {
	var sprite = object_get_sprite(ingredient);
	if (sprite_exists(sprite)) {
		draw_sprite(sprite, 0, x, y);
	}
}

// Draw pickup zone
if (obj_game_manager.is_debug) {
    draw_rectangle(pickup_x1, pickup_y1, pickup_x2, pickup_y2, false)
}