// Step Event
var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Move selection up or down
if (_up) {
	menu_index -= 1;
	if (menu_index < 0) {
		menu_index = array_length(menu_options) - 1;
	} // Loop to bottom
}
if (_down) {
	menu_index += 1;
	if (menu_index >= array_length(menu_options)) {
		menu_index = 0;
	} // Loop to top
}

// Act on selection
if (_select) {
	switch (menu_index) {
		case 0: // Play Game
			room_goto_next();
			break;
		case 1: // Quit
			game_end();
			break;
	}
}
