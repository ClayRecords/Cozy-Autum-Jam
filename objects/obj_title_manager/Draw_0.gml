// Draw Event
//draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw Game Title
draw_set_color(c_white);
draw_text(room_width / 2, room_height * 0.3, "MY AWESOME GAME");

// Draw Menu Options
var _gap = 50; // Pixels between options
for (var i = 0; i < array_length(menu_options); i++) {
	// Highlight the selected option in yellow, others in white
	if (i == menu_index) {
		draw_set_color(c_yellow);
	} else {
		draw_set_color(c_white);
	}

	// Draw the option text
	draw_text(room_width / 2, (room_height * 0.5) + (i * _gap), menu_options[i]);
}
