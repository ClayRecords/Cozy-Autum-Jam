draw_self();

player_dist = distance_to_object(player);
if (register_zone.is_in_register_zone && !order_complete) {
	draw_sprite_ext(textBubble, 0, x - 20, y - 90, 1.5, 1.5, 0, 0, 1);
	order_sprite = object_get_sprite(order);
	draw_sprite(order_sprite, 0, x - 5, y - 82);
	if (keyboard_check_pressed(ord("Y"))) {
		order_complete = true;
	}
}
