function maze_build() {
	// Clean the slate
	with (obj_shelf) {
		instance_destroy();
	}

	// Populate the shelves
	var h_shelf = ds_grid_create(MAZE_COLS - 1, MAZE_ROWS);
	ds_grid_clear(h_shelf, 1);

	var v_shelf = ds_grid_create(MAZE_COLS, MAZE_ROWS - 1);
	ds_grid_clear(v_shelf, 1);

	// Mark every cell as un-checked
	var checked = ds_grid_create(MAZE_CELL_W, MAZE_CELL_H);
	ds_grid_clear(checked, 0);

	var stack = ds_stack_create();
	var cx = irandom(MAZE_CELL_W - 1);
	var cy = irandom(MAZE_CELL_H - 1);

	// Check off the starter space
	checked[# cx, cy] = 1;

	// Add it to the stack with cords
	ds_stack_push(stack, [cx, cy]);

	// Walk through the maze and back
	while (!ds_stack_empty(stack)) {
		// Current space (already checked)
		var current = ds_stack_top(stack);
		cx = current[0];
		cy = current[1];

		var shelves = [];
		// if not a wall && not checked on the other side push to shelves
		if (cx > 0 && !checked[# cx - 1, cy]) {
			array_push(shelves, 0);
		}
		if (cx < MAZE_CELL_W - 1 && !checked[# cx + 1, cy]) {
			array_push(shelves, 1);
		}
		if (cy > 0 && !checked[# cx, cy - 1]) {
			array_push(shelves, 2);
		}
		if (cy < MAZE_CELL_H - 1 && !checked[# cx, cy + 1]) {
			array_push(shelves, 3);
		}

		if (array_length(shelves) == 0) {
			ds_stack_pop(stack); //dead end, back-up homie
			continue; // try again
		}

		var nx = cx;
		var ny = cy;
		switch (shelves[irandom(array_length(shelves) - 1)]) {
			case 0:
				// left
				v_shelf[# cx, cy] = 0;
				nx--;
				break;
			case 1:
				// right
				v_shelf[# cx + 1, cy] = 0;
				nx++;
				break;
			case 2:
				// up
				h_shelf[# cx, cy] = 0;
				ny--;
				break;
			case 3:
				// down
				h_shelf[# cx, cy + 1] = 0;
				ny++;
				break;
		}

		// Check out the new digs
		checked[# nx, ny] = 1;
		ds_stack_push(stack, [nx, ny]);
	}

	// Remove the entrance shelf always.
	v_shelf[# 0, MAZE_ENTRY_ROW] = 0;

	for (var i = 0; i < MAZE_COLS - 1; i++) {
		for (var j = 0; j < MAZE_ROWS; j++) {
			if (h_shelf[# i, j]) {
				// Horizontal Shelves
				instance_create_layer(
					MAZE_X0 + i * MAZE_COL_SPACE + MAZE_COL_SPACE / 2,
					MAZE_Y0 + j * MAZE_COL_SPACE,
					"maze_bits",
					obj_shelf
				);
			}
		}
	}
	for (var i = 0; i < MAZE_COLS; i++) {
		for (var j = 0; j < MAZE_ROWS - 1; j++) {
			if (v_shelf[# i, j]) {
				// Vertical Shelves
				var s = instance_create_layer(
					MAZE_X0 + i * MAZE_COL_SPACE,
					MAZE_Y0 + j * MAZE_COL_SPACE + MAZE_COL_SPACE / 2,
					"maze_bits",
					obj_shelf
				);
				s.image_angle = 90;
			}
		}
	}

	ds_grid_destroy(h_shelf);
	ds_grid_destroy(v_shelf);
	ds_grid_destroy(checked);
	ds_stack_destroy(stack);
}
