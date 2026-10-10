// Randomize seed at start
randomize();

// Build the pillars...
for (var i = 0; i < MAZE_COLS; i++) {
	for (var j = 0; j < MAZE_ROWS; j++) {
		instance_create_layer(
			MAZE_X0 + i * MAZE_COL_SPACE,
			MAZE_Y0 + j * MAZE_COL_SPACE,
			"MazeShelves",
			obj_pillar
		);
	}
}
