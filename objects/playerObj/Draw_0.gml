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
}