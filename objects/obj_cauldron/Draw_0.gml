draw_self();

if (obj_game_manager.is_debug) {
	potion_name = "None";
	if (current_potion != undefined) {
		potion_name = current_potion.name;
	}
	draw_text(x, y, "Potion: " + potion_name);
}
