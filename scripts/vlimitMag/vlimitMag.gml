///@description If the magnitude of a vector is greater than the provided value, limit it.
///@param maxMag
///@param vector

var currentMag = vmag(argument1);

if (currentMag > argument0) {
	vsetMag(argument0, argument1);
}