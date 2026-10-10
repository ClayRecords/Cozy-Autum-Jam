ingredient = undefined;

width = get_obj_width(self);
height = get_obj_height(self);

// Pickup zone settings
pickup_offset = height * 0.75;
pickup_width  = width * 0.9; // Little bit shorter than shelf
pickup_height = height * 0.75; // Not as thick

// Center of pickup zone
var dir = image_angle + 90;
var px = x + lengthdir_x(pickup_offset, dir);
var py = y + lengthdir_y(pickup_offset, dir);

// Half dimensions
var hw = pickup_width / 2;
var hh = pickup_height / 2;

// Rotate the rectangle's four corners
var ca = dcos(image_angle);
var sa = dsin(image_angle);

// Top-left
pickup_x1 = px + (-hw * ca) - (-hh * sa);
pickup_y1 = py + (-hw * sa) + (-hh * ca);

// Bottom-right
pickup_x2 = px + (hw * ca) - (hh * sa);
pickup_y2 = py + (hw * sa) + (hh * ca);