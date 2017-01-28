///@description Update player sprite based on inputs

//Save the direction vector locally
var curDV = global.in[dirVec];

if (abs(curDV[0]) > 0 || abs(curDV[1]) > 0) {
	if (movement.dir[0] > 0) {
		sprite_index = playerESpr;
	} else if (movement.dir[0] < 0) {
		sprite_index = playerWSpr;
	} else if (movement.dir[1] > 0) {
		sprite_index = playerDSpr;
	} else if (movement.dir[1] < 0) {
		sprite_index = playerUSpr;
	}
} else {
	if (movement.dir[0] > 0) {
		sprite_index = playerEStoppedSpr;
	} else if (movement.dir[0] < 0) {
		sprite_index = playerWStoppedSpr;
	} else if (movement.dir[1] > 0) {
		sprite_index = playerDStoppedSpr;
	} else if (movement.dir[1] < 0) {
		sprite_index = playerUStoppedSpr;
	}
}

draw_self();

if (global.debug) {
	draw_rectangle_color(phy_position_x - 3, phy_position_y - 3, phy_position_x + 3, phy_position_y + 3, c_blue, c_blue, c_blue, c_blue, false);
	draw_rectangle_color(movementBoundingBox[0], movementBoundingBox[1], movementBoundingBox[2], movementBoundingBox[3], c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, true);
	
	//get the nearest path nodes and draw them
	var currentNode = pGetNodeCoords(phy_position_x, phy_position_y);
	var otherNodes = pGetAdjacent(currentNode);
	var mouseNode = pGetNodeCoords(mouse_x, mouse_y);
	for (var i=0; i<ds_list_size(otherNodes); i++) {
		var thisNode = otherNodes[| i];
		draw_circle_color(thisNode[? "x"], thisNode[? "y"], 10, c_green, c_green, true);
	}
	
	if (pLineOfSight(currentNode, mouseNode)) {
		draw_line_color(currentNode[? "x"], currentNode[? "y"], mouseNode[? "x"], mouseNode[? "y"], c_green, c_green);
	} else {
		draw_line_color(currentNode[? "x"], currentNode[? "y"], mouseNode[? "x"], mouseNode[? "y"], c_red, c_red);
	}
}