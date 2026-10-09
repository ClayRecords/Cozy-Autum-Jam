/**
 * Generates a sine wave value over time.
 *
 * The output oscillates smoothly between (midpoint - amplitude)
 * and (midpoint + amplitude) over the specified period.
 *
 * @param {Real} time - The current time or step value driving the wave.
 * @param {Real} period - The duration of one full cycle of the sine wave.
 * @param {Real} amplitude - The peak deviation from the midpoint.
 * @param {Real} midpoint - The center value around which the wave oscillates.
 * @returns {Real} The calculated sine wave value at the given time.
 */
function sine_wave(time, period, amplitude, midpoint) {
	return sin(time * 2 * pi / period) * amplitude + midpoint;
}

/**
 * Generates a sine wave value constrained between a minimum and maximum.
 *
 * Internally calculates the midpoint and amplitude so the output
 * stays within the provided bounds.
 *
 * @param {Real} time - The current time or step value driving the wave.
 * @param {Real} period - The duration of one full cycle of the sine wave.
 * @param {Real} minimum - The lower bound of the wave.
 * @param {Real} maximum - The upper bound of the wave.
 * @returns {Real} The calculated sine wave value between minimum and maximum.
 */
function sine_between(time, period, minimum, maximum) {
	var midpoint = mean(minimum, maximum);
	var amplitude = maximum - midpoint;
	return sine_wave(time, period, amplitude, midpoint);
}
