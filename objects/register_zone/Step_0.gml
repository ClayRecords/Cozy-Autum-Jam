function cover_up() {
	image_alpha = 1;
}

if (point_in_rectangle(player.x, player.y, x1, y1, x2, y2)) {
	is_in_register_zone = true;
	if (!is_cover_up) {
		cover_up();
	}
} else {
	if (is_in_register_zone) {
		is_in_register_zone = false;
		is_cover_up = false;
		image_alpha = 0;
	}
}
