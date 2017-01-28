///@description Gets the distance in a straight line between two nodes
///@param node1
///@param node2

var pos1 = [argument0[? "x"], argument0[? "y"]];
var pos2 = [argument1[? "x"], argument1[? "y"]];

var dist = vsubTo(pos1, pos2);

return vmag(dist);