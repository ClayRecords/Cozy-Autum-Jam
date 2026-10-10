var _horizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A")));
var _vertical = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

var vector_length = point_distance(0, 0, _horizontal, _vertical);

var normalized_x = 0;
var normalized_y = 0;

if(vector_length > 0) {
    normalized_x = _horizontal / vector_length * speed_multi;
    normalized_y = _vertical / vector_length * speed_multi;
}

collide_objs = [obj_shelf, obj_pillar];

move_and_collide(normalized_x, normalized_y, collide_objs);

move_timer = 0;
if (_horizontal != 0 || _vertical != 0) {
	if (_horizontal > 0) {
		sprite_index = player_sprite_right;
	} else if (_horizontal < 0) {
		sprite_index = player_sprite_left;
	} else if (_vertical < 0) {
		sprite_index = player_sprite_up;
	} else if (_vertical > 0) {
		sprite_index = player_sprite_down;
	}
} else {
	if (sprite_index == player_sprite_up) {
		sprite_index = player_sprite_up_still;
	} else if (sprite_index == player_sprite_down) {
		sprite_index = player_sprite_down_still;
	} else if (sprite_index == player_sprite_right) {
		sprite_index = player_sprite_right_still;
	} else if (sprite_index == player_sprite_left) {
		sprite_index = player_sprite_left_still;
	}
}
//else {
//if (sprite_index == player_sprite_up) {
//sprite_index = player_sprite_up_still
//}
//else if (sprite_index == player_sprite_down) {
//sprite_index = player_sprite_down_still
//}
//else if (sprite_index == player_sprite_right) {
//sprite_index = player_sprite_right_still
//}
//else if (sprite_index == player_sprite_left){
//sprite_index = player_sprite_left_still
//}
//} 
