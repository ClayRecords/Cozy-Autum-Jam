is_paused = false;
pause_surface = -1;
pause_surface_buffer = -1;

function pause() {
	// Deactivate everything except pause manager
	instance_deactivate_all(true);

	resolution_w = display_get_width();
	resolution_h = display_get_height();

	// Capture background
	pause_surface = surface_create(resolution_w, resolution_h);
	surface_set_target(pause_surface);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();

	// Back up surface to buffer
	if (buffer_exists(pause_surface_buffer)) {
		buffer_delete(pause_surface_buffer);
	}
	pause_surface_buffer = buffer_create(
		resolution_w * resolution_h * 4,
		buffer_fixed,
		1
	);
	buffer_get_surface(pause_surface_buffer, pause_surface, 0);
}

function unpause() {
	instance_activate_all();
	clear_surface_and_buffer();
}

function clear_surface_and_buffer() {
	if (surface_exists(pause_surface)) {
		surface_free(pause_surface);
	}
	if (buffer_exists(pause_surface_buffer)) {
		buffer_delete(pause_surface_buffer);
	}
}
