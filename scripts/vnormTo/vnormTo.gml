///@description Normalize a vector.  Returns a new vector
///@param vector

var vLength = vmag(argument0);

if (vLength != 0) {
	return [argument0[0]/vLength, argument0[1]/vLength];
} else {
	return undefined;
}