///@description Set the magnitude of a vector.  Changes original vector
///@param mag
///@param vector

if (vmag(argument1) != 0) {
	vnorm(argument1);
	vscale(argument0, argument1);
}
