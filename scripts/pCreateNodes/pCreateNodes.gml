///@description Create vertices aligned with a grid of <width> and <height>
///@param width
///@param height

// real [x, y] position, parent, g-value (score)

var horNodes = argument0+1;
var vertNodes = argument1+1;

var pathNodes = ds_grid_create(horNodes, vertNodes);

for (var xpos=0; xpos<horNodes; xpos++) {
	for (var ypos=0; ypos<vertNodes; ypos++) {
		var thisNode = ds_map_create();
		ds_map_add(thisNode, "xindex", xpos);
		ds_map_add(thisNode, "yindex", ypos);
		ds_map_add(thisNode, "x", xpos*global.pathRes);
		ds_map_add(thisNode, "y", ypos*global.pathRes);
		ds_map_add(thisNode, "parent", noone);
		ds_map_add(thisNode, "g", 100000);
		pathNodes[# xpos, ypos] = thisNode;
	}
}
return pathNodes;
