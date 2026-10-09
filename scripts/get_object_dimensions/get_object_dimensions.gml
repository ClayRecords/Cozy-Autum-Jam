/**
 * Returns width of an object.
 * 
 * @param {Id.Instance} obj	- The object.
 * @returns {Real}
 */
function get_obj_width(obj) {
	var start_coords = get_object_corner_coordinate(obj, CORNER.TOP_LEFT);
	var end_coords = get_object_corner_coordinate(obj, CORNER.TOP_RIGHT);
	var x_start = start_coords[0];
	var y_start = start_coords[1];
	var x_end = end_coords[0];
	var y_end = end_coords[1];
	return point_distance(x_start, y_start, x_end, y_end);
}

/**
 * Returns height of an object.
 * 
 * @param {Id.Instance} obj	- The object.
 * @returns {Real}
 */
function get_obj_height(obj) {
	var start_coords = get_object_corner_coordinate(obj, CORNER.TOP_LEFT);
	var end_coords = get_object_corner_coordinate(obj, CORNER.BOTTOM_LEFT);
	var x_start = start_coords[0];
	var y_start = start_coords[1];
	var x_end = end_coords[0];
	var y_end = end_coords[1];
	return point_distance(x_start, y_start, x_end, y_end);
}

/**
 * Returns room coordinates of an object's specified corner.
 * 
 * @param {Id.Instance} obj	- The object.
 * @param {Enum.CORNER} corner - The corner to return the coordinates of.
 * @returns {Array<Real>}
 */
function get_object_corner_coordinate(obj, corner) {
	var spr = obj.sprite_index;
	if (spr == noone) {
		return [obj.x, obj.y];
	}

	var corner_x = 0;
	var corner_y = 0;
	switch (corner) {
		case CORNER.TOP_LEFT:
			corner_x = -sprite_get_xoffset(spr) * obj.image_xscale;
			corner_y = -sprite_get_yoffset(spr) * obj.image_yscale;
			break;
		case CORNER.TOP_RIGHT:
			corner_x =
				(sprite_get_width(spr) - sprite_get_xoffset(spr)) * obj.image_xscale;
			corner_y = -sprite_get_yoffset(spr) * obj.image_yscale;
			break;
		case CORNER.BOTTOM_LEFT:
			corner_x = -sprite_get_xoffset(spr) * obj.image_xscale;
			corner_y =
				(sprite_get_height(spr) - sprite_get_yoffset(spr)) * obj.image_yscale;
			break;
		case CORNER.BOTTOM_RIGHT:
			corner_x =
				(sprite_get_width(spr) - sprite_get_xoffset(spr)) * obj.image_xscale;
			corner_y =
				(sprite_get_height(spr) - sprite_get_yoffset(spr)) * obj.image_yscale;
			break;
	}

	// Rotate around instance origin
	var dist = point_distance(0, 0, corner_x, corner_y);
	var dir = point_direction(0, 0, corner_x, corner_y);

	// Final room coordinates
	var room_x = obj.x + lengthdir_x(dist, dir + obj.image_angle);
	var room_y = obj.y + lengthdir_y(dist, dir + obj.image_angle);
	return [room_x, room_y];
}

enum CORNER {
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT,
}
