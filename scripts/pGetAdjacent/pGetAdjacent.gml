///@description Gets nodes adjacent to the provided one
///@param node

var adjacent = ds_list_create();

var xindex = argument0[? "xindex"];
var yindex = argument0[? "yindex"];

if (xindex - 1 >= 0 && yindex - 1 >= 0) {
	ds_list_add(adjacent, global.pathNodes[# xindex-1, yindex-1]);
	ds_list_add(adjacent, global.pathNodes[# xindex-1, yindex]);
	ds_list_add(adjacent, global.pathNodes[# xindex, yindex-1]);
}
if (xindex + 1 < ds_grid_width(global.pathNodes) && yindex - 1 >= 0) {
	ds_list_add(adjacent, global.pathNodes[# xindex+1, yindex-1]);
}
if (yindex + 1 < ds_grid_height(global.pathNodes) && xindex - 1 >= 0) {
	ds_list_add(adjacent, global.pathNodes[# xindex-1, yindex+1]);
}
if (xindex + 1 < ds_grid_width(global.pathNodes) && yindex + 1 < ds_grid_height(global.pathNodes)) {
	ds_list_add(adjacent, global.pathNodes[# xindex+1, yindex+1]);
	ds_list_add(adjacent, global.pathNodes[# xindex+1, yindex]);
	ds_list_add(adjacent, global.pathNodes[# xindex, yindex+1]);
}
for (var i=0; i<ds_list_size(adjacent); i++) {
	if (adjacent[| i] == -1) {
		ds_list_delete(adjacent, i);
		i -= 1;
	}
}

return adjacent;