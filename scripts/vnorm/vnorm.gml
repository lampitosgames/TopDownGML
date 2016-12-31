///@description Normalize a vector.  Modifies originals
///@param vector

var vLength = vmag(argument0);
if (vLength != 0) {
	argument0[@ 0] /= vLength;
	argument0[@ 1] /= vLength;
}