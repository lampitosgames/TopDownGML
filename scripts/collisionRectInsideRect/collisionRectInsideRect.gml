///@description Checks if the first rectangle passed is entirely inside the second.
///@param rect1
///@param rect2

var r1 = argument0;
var r2 = argument1;

if (r1[0] >= r2[0] && r1[2] <= r2[2] && r1[1] >= r2[1] && r1[3] <= r2[3]) {
	return true;
} else {
	return false;
}