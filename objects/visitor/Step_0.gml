/**
 * Moves the ghost towards the door and fades out.
 * 
 */
start_destroy = function(){
    exit_x = 70;
    exit_y = 512;
    move_towards_point(exit_x, exit_y, movement_speed);
    image_alpha = lerp(image_alpha, 0, .1);
    if(abs(point_distance(exit_x, exit_y, x, y))<20) is_leaving = true;
}

if(order_complete){
    self.start_destroy();
    if(is_leaving){
        instance_destroy(self);
    }
}

start_create = function(){
    enter_x = 75;
    enter_y = 270;
    move_towards_point(enter_x, enter_y, movement_speed);
    image_alpha = lerp(image_alpha, 1, .1);
    if(abs(point_distance(enter_x, enter_y, x, y))<20){
        is_entering = false;
        speed = 0;
    }
}

if(is_entering){
    self.start_create();
}