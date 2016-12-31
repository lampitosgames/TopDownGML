///@description Set the magnitude of a vector.  Returns new vector.  Will not work on the zero vector
///@param mag
///@param vector

if (vmag(argument1) != 0) {
	var normalized = vnormTo(argument1);
	return vscaleTo(argument0, normalized);
} else {
	return [0, 0];
}
