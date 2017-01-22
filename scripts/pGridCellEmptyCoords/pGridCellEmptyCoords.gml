///@description Checks to see if the specific grid cell is 0 (empty)
///@param xpos
///@param ypos

var xindex = floor(argument0/global.pathRes);
var yindex = floor(argument1/global.pathRes);

if (global.pathGrid[# xindex, yindex] == 0) {
	return true;
} else {
	return false;
}