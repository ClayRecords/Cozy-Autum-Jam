function start_destroy() {
	target_x = 70;
	target_y = 512;
	move_towards_point(target_x, target_y, movement_speed);
	image_alpha = lerp(image_alpha, 0, 0.1);
	if (abs(point_distance(x, y, target_x, target_y)) < 20) {
		is_leaving = true;
	}
}

if (order_complete) {
	start_destroy();
	if (is_leaving) {
		instance_destroy(self);
	}
}

function start_enter() {
	target_x = 75;
	target_y = 270;
	move_towards_point(target_x, target_y, movement_speed);
	if (abs(point_distance(x, y, target_x, target_y)) < 20) {
		is_entering = false;
		speed = 0;
	}
}

if (is_entering) {
	start_enter();
}
