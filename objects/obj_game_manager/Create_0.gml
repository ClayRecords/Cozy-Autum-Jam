// Debug mode, for analytics and testing
is_debug = false;

current_ghost = undefined;

/**
 * Creates a new ghost object as the next customer.
 * 
 * @returns {Object} - A new ghost, with their {order} included.
 */
create_new_ghost = function() {
	current_ghost = instance_create_layer(75, 512, "Instances", obj_visitor);
	current_ghost.order = obj_potion_invisibility;
};

self.create_new_ghost();
