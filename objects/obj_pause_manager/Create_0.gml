is_paused = false;
pause_surface = -1;
pause_surface_buffer = -1;

function pause() {
	is_paused = true;

	// Deactivate everything except pause manager
	instance_deactivate_all(true);

    resolution_w = room_width
    resolution_h = room_height

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

    
    
	// Add buttons
	button_x = resolution_w / 2;
    unpause_btn = instance_create_layer(button_x, 500, "Instances", obj_button_unpause, {
        image_xscale: 3
    });
}

function unpause() {
	is_paused = false;
	instance_activate_all();
	cleanup();
}

function cleanup() {
	if (surface_exists(pause_surface)) {
		surface_free(pause_surface);
	}
	if (buffer_exists(pause_surface_buffer)) {
		buffer_delete(pause_surface_buffer);
	}
    
    // Delete buttons
    instance_destroy(unpause_btn)
}
