///@description Get neighboring nodes with direct line of sight
///@param node

var node = argument0;
var adjacent = pGetAdjacent(node);

for (var i=0; i<ds_list_size(adjacent); i++) {
	if (!pLineOfSight(node, adjacent[| i])) {
		ds_list_delete(adjacent, i);
		i -= 1;
	}
}
return adjacent;