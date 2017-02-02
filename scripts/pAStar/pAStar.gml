///@description Path from a start node to an end node using basic A* pathfinding
///@param startNode
///@param endNode

var nStart = argument0, nEnd = argument1;
var open = ds_priority_create(), closed = ds_list_create(), openMap = ds_map_create();

//If either the start or end nodes are blocked by objects, there is no valid path.  Return false
if (!pGridCellEmptyCoords(nStart[? "x"], nStart[? "y"]) || !pGridCellEmptyCoords(nEnd[? "x"], nEnd[? "y"])) {
	return false;
}

nStart[? "g"] = 0;
nStart[? "parent"] = nStart;
//TODO add heuristic
ds_priority_add(open, nStart, nStart[? "g"] + pDistBetween(nStart, nEnd));
ds_map_add(openMap, nStart, 1);

//While there are no remaining open nodes
while (!ds_priority_empty(open)) {
	//Pop the node with lowest priority
	var sNode = ds_priority_delete_min(open);
	//If this node is the end node, the path was found
	if (sNode == nEnd) {
		ds_list_destroy(closed);
		ds_map_destroy(openMap);
		ds_priority_destroy(open);
		return true;
	}
	
	//Add the sNode to the list of visited nodes
	ds_list_add(closed, sNode);
	//Get visible neighbors of the node and loop through them
	var neighbors = pGetAdjJPS(sNode);
	for (var i=0; i<ds_list_size(neighbors); i++) {
		var nNode = neighbors[| i];
		//If the neighbor node is not in the closed list
		if (ds_list_find_index(closed, nNode) == -1) {
			//If the neighbor node is not in the open queue
			if (openMap[? nNode] == undefined) {
				//Set it's weight to infinite
				nNode[? "g"] = 100000;
				//Set it to have no parent
				nNode[? "parent"] = noone;
			}
			//Update the nodes
			if (sNode[? "g"] + pDistBetween(sNode, nNode) < nNode[? "g"]) {
				nNode[? "g"] = sNode[? "g"] + pDistBetween(sNode, nNode);
				nNode[? "parent"] = sNode;
				ds_priority_delete_value(open, nNode);
				ds_priority_add(open, nNode, nNode[? "g"] + pDistBetween(nNode, nEnd));
				ds_map_add(openMap, nNode, 1);
			}
		}
	}
	ds_list_destroy(neighbors);
}

ds_list_destroy(closed);
ds_map_destroy(openMap);
ds_priority_destroy(open);

//If we break out of the while loop, no path was found
return false;