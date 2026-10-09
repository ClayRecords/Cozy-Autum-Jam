var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(
	_horizontal,
	_vertical,
	tile_map,
	undefined,
	undefined,
	undefined,
	move_speed,
	move_speed
);

if (_horizontal != 0 || _vertical != 0) {
	if (_horizontal > 0 && _vertical == 0) {
		sprite_index = player_sprite_right;
	}
	if (_horizontal < 0 && _vertical == 0) {
		sprite_index = player_sprite_left;
	}
	if (_horizontal == 0 && _vertical > 0) {
		sprite_index = player_sprite_down;
	}
	if (_horizontal == 0 && _vertical < 0) {
		sprite_index = player_sprite_up;
	}

	if (_horizontal > 0 && _vertical > 0) {
		sprite_index = player_sprite_down_right;
	}
	if (_horizontal < 0 && _vertical > 0) {
		sprite_index = player_sprite_down_left;
	}
	if (_horizontal > 0 && _vertical < 0) {
		sprite_index = player_sprite_up_right;
	}
	if (_horizontal < 0 && _vertical < 0) {
		sprite_index = player_sprite_up_left;
	}
}
