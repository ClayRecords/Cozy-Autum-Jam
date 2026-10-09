/**
 * Moves object to contact with solid, based on speed.
 * 
 * @param {asset} obj The object to move.
 * @returns {void}
 */
function move_to_solid(obj) {
	with (obj) {
		if (place_free(x + hspeed, y)) {
			x += hspeed;
		} else {
			if (hspeed < 0) {
				// Hit left
				move_contact_solid(180, abs(hspeed));
			} else {
				// Hit right
				move_contact_solid(0, abs(hspeed));
			}
			hspeed = 0;
		}

		if (place_free(x, y + vspeed)) {
			y += vspeed;
		} else {
			if (vspeed < 0) {
				// Hit above
				move_contact_solid(90, abs(vspeed));
			} else {
				// Hit below
				move_contact_solid(270, abs(vspeed));
			}
			vspeed = 0;
		}
	}
}
