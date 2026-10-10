// Debug mode, for analytics and testing
is_debug = false;

current_ghost = undefined;

money = 0;

/**
 * Creates a new ghost object as the next customer.
 */
create_new_ghost = function() {
	current_ghost = instance_create_layer(144, 512, "Instances", obj_visitor);
	current_ghost.order = obj_potion_invisibility;
};

self.create_new_ghost();

/**
 * Increase money based on potion cost + tip from visitor.
 * @param {Id.instance} obj_visitor visitor who has been taken care of.
 */
function get_paid(obj_visitor) {
	potion_cost = obj_visitor.order.cost;
	tip_percent = obj_visitor.tip;
	money += potion_cost * tip_percent;
}
