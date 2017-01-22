///@description Gets the node nearest to the location
///@param xpos
///@param ypos

var xindex = round(argument0/global.pathRes);
var yindex = round(argument1/global.pathRes);

return global.pathNodes[# xindex, yindex];