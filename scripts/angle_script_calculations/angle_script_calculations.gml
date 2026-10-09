/**
 * Returns distance between two objects' xy points.
 * 
 * @param {Asset} obj_1 - Object 1.
 * @param {Asset} obj_2 - Object 2.
 * @returns {Real}
 */
function obj_point_distance(obj_1, obj_2) {
	return point_distance(obj_1.x, obj_1.y, obj_2.x, obj_2.y);
}

/**
 * Returns direction between two objects' xy points.
 * 
 * @param {Asset} obj_1 - Object 1.
 * @param {Asset} obj_2 - Object 2.
 * @returns {Real}
 */
function obj_point_direction(obj_1, obj_2) {
	return point_direction(obj_1.x, obj_1.y, obj_2.x, obj_2.y);
}
