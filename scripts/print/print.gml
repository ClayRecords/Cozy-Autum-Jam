/**
 * Prints one or more values to the debug console.
 *
 * Concatenates all provided arguments into a single string, 
 * separated by spaces, and outputs it using show_debug_message.
 *
 * @returns {void}
 */
function print() {
	var _str = "";

	for (var i = 0; i < argument_count; i++) {
		_str += string(argument[i]);
		_str += " ";
	}

	show_debug_message(_str);
}
