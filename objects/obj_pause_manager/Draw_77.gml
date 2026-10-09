//gpu_set_blendenable(false);

// Draw frozen image to screen while paused
if (is_paused) {
	surface_set_target(application_surface);
	if (surface_exists(pause_surface)) {
		draw_surface(pause_surface, 0, 0);
	} else {
		pause_surface = surface_create(resolution_w, resolution_h);
		buffer_set_surface(pause_surface_buffer, pause_surface, 0);
	}

	// Draw blackened background
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	draw_set_color(c_white);

	surface_reset_target();
}
