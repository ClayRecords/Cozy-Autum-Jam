// Debug mode, for analytics and testing
is_debug = false;
current_ghost = {};

/**
 * Creates a new ghost object as the next customer.
 * 
 * @returns {Object} - A new ghost, with their {order} included.
 */
create_new_ghost = function(){
    ghost = instance_create_layer(75,512,"Instances", visitor)
    ghost.order = potion;
    self.current_ghost = ghost;
}

self.create_new_ghost();