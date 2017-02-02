///@description Gets nodes adjacent to the provided one
///@param node

var adjacent = ds_list_create();

var xindex = argument0[? "xindex"];
var yindex = argument0[? "yindex"];

var nParent = argument0[? "parent"];
var npxind = nParent[? "xindex"];
var npyind = nParent[? "yindex"];

var dir = [xindex-npxind, yindex-npyind];
var hasForcedNeighbors = false;


//Obviously add the next successor
ds_list_add(adjacent, global.pathNodes[# xindex+dir[0], yindex+dir[1]]);

//If this is a diagonal
if (dir[0] != 0 && dir[1] != 0) {
	//also add the vertical and horizontal nodes
	ds_list_add(adjacent, global.pathNodes[# xindex+dir[0], yindex]);
	ds_list_add(adjacent, global.pathNodes[# xindex, yindex+dir[1]]);
	//Line of sight check for forced neighbors
	if (pLineOfSight(nParent, global.pathNodes[# npxind+dir[0]+dir[0], npyind]) == false) {
		ds_list_add(adjacent, global.pathNodes[# npxind+dir[0]+dir[0], npyind]);
		hasForcedNeighbors = true;
	}
	if (pLineOfSight(nParent, global.pathNodes[# npxind, npyind+dir[1]+dir[1]]) == false) {
		ds_list_add(adjacent, global.pathNodes[# npxind, npyind+dir[1]+dir[1]]);
		hasForcedNeighbors = true;
	}
//Else, if this is actually the start node
} else if (dir[0] == 0 && dir[1] == 0) {
	ds_list_destroy(adjacent);
	adjacent = pGetAdjacent(argument0);
//This is not a diagonal
} else {
	if (dir[0] == 0) {
		if (pLineOfSight(nParent, global.pathNodes[# xindex-1, yindex+dir[1]]) == false) {
			ds_list_add(adjacent, global.pathNodes[# xindex-1, yindex+dir[1]]);
			hasForcedNeighbors = true;
		}
		if (pLineOfSight(nParent, global.pathNodes[# xindex+1, yindex+dir[1]]) == false) {
			ds_list_add(adjacent, global.pathNodes[# xindex+1, yindex+dir[1]]);
			hasForcedNeighbors = true;
		}
		
	} else if (dir[1] == 0) {
		if (pLineOfSight(nParent, global.pathNodes[# xindex+dir[0], yindex-1]) == false) {
			ds_list_add(adjacent, global.pathNodes[# xindex+dir[0], yindex-1]);
			hasForcedNeighbors = true;
		}
		if (pLineOfSight(nParent, global.pathNodes[# xindex+dir[0], yindex+1]) == false) {
			ds_list_add(adjacent, global.pathNodes[# xindex+dir[0], yindex+1]);
			hasForcedNeighbors = true;
		}
	}
}

//Remove weird values or values without line of sight
for (var i=0; i<ds_list_size(adjacent); i++) {
	if (adjacent[| i] == -1 || adjacent[| i] == undefined || !pLineOfSight(argument0, adjacent[| i])) {
		ds_list_delete(adjacent, i);
		i -= 1;
	}
}

return adjacent;