var _horizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * speed_multi;
var _vertical = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * speed_multi;

collide_objs = [obj_shelf, obj_pillar]
move_and_collide(_horizontal, _vertical, collide_objs);

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
