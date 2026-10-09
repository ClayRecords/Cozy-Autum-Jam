/**
 * Linearly interpolates between two angles using the shortest rotation path.
 * 
 * @param {Real} ang1 - The starting angle in degrees.
 * @param {Real} ang2 - The target angle in degrees.
 * @param {Real} amt - Interpolation amount (typically between 0 and 1).
 * @returns {Real} - The interpolated angle, normalized to the range [0, 360).
 */
function angle_lerp(ang1, ang2, amt) {
	var diff = angle_difference(ang2, ang1);
	return (ang1 + diff * amt + 360) % 360;
}
