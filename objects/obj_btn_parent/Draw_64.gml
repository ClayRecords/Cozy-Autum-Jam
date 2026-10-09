// Set tint based on state
var tint = c_white;
if (clicked) {
	tint = make_color_rgb(200, 200, 200);
} else if (hovering) {
	tint = make_color_rgb(220, 220, 220);
}

// Draw button
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	tint,
	image_alpha
);

// Draw text
//draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, button_text);
